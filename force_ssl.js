// Copyright (c) 2018 Jan "JayVii" <jayvii@posteo.de>
// SPDX-License-Identifier: GPL-3.0

// if protocol is not https, use https!
if (location.protocol != 'https:'){
    location.href = 'https:' + window.location.href.substring(window.location.protocol.length);
}
