import importlib.util
import tempfile
import unittest
from pathlib import Path


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]


def load_verify_module():
    spec = importlib.util.spec_from_file_location("repository_verify", REPOSITORY_ROOT / "verify.py")
    if spec is None or spec.loader is None:
        raise RuntimeError("verify.py could not be loaded")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class RepositoryVerificationTest(unittest.TestCase):
    def test_repository_contract_passes_for_checked_in_tree(self):
        verify = load_verify_module()

        errors = verify.validate_repository(REPOSITORY_ROOT)

        self.assertEqual([], errors)

    def test_missing_required_file_is_reported(self):
        verify = load_verify_module()
        with tempfile.TemporaryDirectory() as temporary_directory:
            root = Path(temporary_directory)

            errors = verify.validate_repository(root)

        self.assertIn("missing required file: README.md", errors)


if __name__ == "__main__":
    unittest.main()
