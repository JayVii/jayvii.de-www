// Copyright (c) 2018 Jan "JayVii" <jayvii@posteo.de>
// SPDX-License-Identifier: GPL-3.0

// Disclaimer:
// This is necessary, because jayvii.de is not distributed through apache
// directly, but rather through a proxy-service.

// if protocol is http, use https!
if (window.location.protocol == "http"){
    window.location.href = "https" + window.location.href.slice(4);
}
