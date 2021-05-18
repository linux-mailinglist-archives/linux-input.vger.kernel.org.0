Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E51387A04
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 15:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349650AbhERNcw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 09:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349647AbhERNcw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 09:32:52 -0400
X-Greylist: delayed 585 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 18 May 2021 06:31:34 PDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B7BC061573;
        Tue, 18 May 2021 06:31:34 -0700 (PDT)
Date:   Tue, 18 May 2021 15:21:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1621344101;
        bh=c73kIoBsDpAy+yCZg+mOnr7VdjTq2wMsaBIYMScY8l4=;
        h=Date:From:To:Cc:Subject:From;
        b=RY7sbvsayItCmTcrOiNlGHGPirtg8zTW33X5Y9wQXaiUs5BbrPlC0OgWz9M8DA033
         VSq/JVpFhGUHh8xLDX0XT9Mp/s67wtCAf9cPgFksTYcdS0eHXRUPJgny3YLOrCCflA
         L0qWMUXLH2Mp2nXyjYQYhuqN61ZpcC0GIqZRDZ0Y=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-kernel@vger.kernel.org
Subject: Handling of USB "Programmable button" controls as KEY_MACRO# events
Message-ID: <6ebbb200-1f2c-450b-8fae-e5e2dd9b6be9@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi everybody,

Would it make sense to map the "Programmable Buttons" control from the
USB HID Consumer page [0] to the linux event codes KEY_MACRO1 ... KEY_MACRO# ?

Those controls are documented in the USB spec as:

"The user defines the function of these
buttons to control software applications or GUI objects."

The KEY_MACRO event codes are documented with:

"Some keyboards have keys which do not have a defined meaning, these keys
are intended to be programmed / bound to macros by the user."

My usecase is the passing of custom keycodes from a programmable keypad
(via QMK[1]) to Linux.
(This would also need new functionality in QMK itself)

Alternatives:

* Send Raw HID from QMK
  * Con: needs a dedicated, nonstandard driver on the host
* Use F-Keys
  * Con: only F13-F19 are usable (F1-F12 are used by normal keyboards, F20-F23
    are repurposed with other keys for X11 compat)

Possible problems:

* There are 65k programmable keys defined by USB but only 30 macro keys are
  supported by Linux.

Thanks,
Thomas

[0] https://www.usb.org/sites/default/files/hut1_22.pdf#section.15.14
[1] https://qmk.fm/
