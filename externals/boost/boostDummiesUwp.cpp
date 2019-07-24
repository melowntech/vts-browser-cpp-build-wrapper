
/*
This file contains DUMMY implementation for supposedly unused boost functions.
When any of these functions is called, the application will forcibly terminate.
This is to make you aware of using unsupported functions.
*/

#include "boost/filesystem.hpp"
#include "windows_file_codecvt.hpp"



namespace boost
{
namespace filesystem
{
namespace detail
{

bool create_directories(const path& p, system::error_code* ec)
{
    std::terminate();
    return false;
}

void rename(const path& old_p, const path& new_p, system::error_code* ec)
{
    std::terminate();
}

file_status status(const path&p, system::error_code* ec)
{
    std::terminate();
    return {};
}

boost::uintmax_t remove_all(const path& p, system::error_code* ec)
{
    std::terminate();
    return {};
}

}
}
}


std::codecvt_base::result windows_file_codecvt::do_in(std::mbstate_t& state,
    const char* from, const char* from_end, const char*& from_next,
    wchar_t* to, wchar_t* to_end, wchar_t*& to_next) const
{
    std::terminate();
    return {};
}

std::codecvt_base::result windows_file_codecvt::do_out(std::mbstate_t & state,
    const wchar_t* from, const wchar_t* from_end, const wchar_t*& from_next,
    char* to, char* to_end, char*& to_next) const
{
    std::terminate();
    return {};
}

