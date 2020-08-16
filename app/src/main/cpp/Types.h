#pragma once

#include <memory>
#include <vector>

typedef unsigned char byte;
typedef std::shared_ptr <std::string> shared_ptr_to_string;
typedef std::vector<byte> vector_of_bytes;
typedef std::shared_ptr<std::vector<byte>> shared_ptr_to_vector_of_bytes;
typedef std::shared_ptr<std::vector<std::shared_ptr<std::vector<byte>>>>
shared_ptr_to_vector_of_shared_ptr_to_vector_of_bytes;
