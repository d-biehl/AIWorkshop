from os import PathLike
from pathlib import Path
from pydantic_ai import (
    ImageUrl,
    BinaryContent as OrigBinaryContent,
    AudioUrl,
    DocumentUrl,
    VideoUrl,
)

__all__ = [
    "load_binary_content",
    "ImageUrl",
    "AudioUrl",
    "DocumentUrl",
    "VideoUrl",
    "BinaryContent",
]


class BinaryContent(OrigBinaryContent):
    def __repr__(self):
        return (
            f"BinaryContent(media_type={self.media_type}, size={len(self.data)} bytes)"
        )

    def __str__(self):
        return (
            f"BinaryContent(media_type={self.media_type}, size={len(self.data)} bytes)"
        )


def load_binary_content(path: PathLike[str], mime_type: str) -> BinaryContent:
    """Load binary content from various types of URLs or binary content."""
    return BinaryContent(data=Path(path).read_bytes(), media_type=mime_type)
