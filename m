Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEE2183DD
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 04:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfEICjK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 May 2019 22:39:10 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41848 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfEICjJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 May 2019 22:39:09 -0400
Received: by mail-qt1-f196.google.com with SMTP id c13so845687qtn.8
        for <linux-input@vger.kernel.org>; Wed, 08 May 2019 19:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8JIdFWt9EhJ27YwtTKJWjA31c5Y15g2X/6abYDZaxSI=;
        b=YjeiVL9YOP0BtRGLoQ3dKbmyzNDX+L5Yjtwi75kjCgxrucDoY8M1mwLY8SiDLSQP49
         55pWR6LzymblOrB9/bZZV/dluwJ6GiSloEExwTRcj3HfhN2HAruWhTrIAKKuIvFe30Ou
         aypP0WGMCUh2lCses3I+VVTnAG0SYBFh0tGSYdgp1BWikVAzVKg8ZBEcpJOGR+0oXdCj
         +zifbvtJgQxvVqnEQu8CQ1up/N/3Gh7OeyQAYnSVgqKWh+bZiN0HYnu+uyPSmWHF07qL
         s23pp9q6NS2Bu6MYsLZimZIMP+sydT4Dpha6Jl1KPeKNZD4j0l+98evKdSynaNfVJ/bo
         ZT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8JIdFWt9EhJ27YwtTKJWjA31c5Y15g2X/6abYDZaxSI=;
        b=f8aymFRJkCBF8wKxzLZ6mgYhpdWCSjdyrLM0KoFFiwJ/Xrwo4xbHlA2G3wutMtrWe4
         s3oe2hvEkCqOkbsV6v9tfytnf4DazD4Gjb4vCzaS+h1x9K3nqSZ9Li0/NuFyF+VeoMLP
         fZe7XRr4I6LOvDpTopEbH3XqXknF4byR6ph0sFNdTGKek09zcHJG00cY80rZhUVNGSBM
         CQGFHKV+Nkd4Q68TBuhbxrzdodiKN05JwMufp9MIbtF37W8yZyl8IL6+l+qKKCJEqu3Y
         gt6ZJbrZ7IorIWsaqZtvJs0lWrYAruU4Xv9ar+P4ju5VxMPwHxI8C7Mzu/O4F21l4wdp
         cXNA==
X-Gm-Message-State: APjAAAW2ivbCFk9k5lOYlZQQ6rv4h14nayCnLNFqoH2xe4EgNx0YNN9z
        6KY8IDdWVy6Zkqwj6+fiJqAjr8Z/xIbRTHVxFYOZGNyNcyU=
X-Google-Smtp-Source: APXvYqyBJXvyO4wOwRcbfGWKTzD31R5S2okTzyq3vZ4EXkD1yvmWKaPNYzH1ix8XKUjp/QYSjzu8K+CX8Pb3IW6CQzw=
X-Received: by 2002:ac8:222f:: with SMTP id o44mr1368009qto.198.1557369548585;
 Wed, 08 May 2019 19:39:08 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Drake <drake@endlessm.com>
Date:   Thu, 9 May 2019 10:38:57 +0800
Message-ID: <CAD8Lp46veF458PQXXRY85UAHFjP-toMeZ=zpqUqoT6axP2osaQ@mail.gmail.com>
Subject: Intel Amber Lake I2C/GpioInt issue, ELAN touchpad unusable
To:     linux-input <linux-input@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Endless Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

We're working with a new consumer laptop product based on Intel Amber
Lake (Intel Core m3-8100Y). Unfortunately the hid-multitouch touchpad
is not working right - when using the touchpad there are lots of
cursor jumps, and libinput also complains that it's detected/ignored
several jumps every second. This has been reproduced on Linus git as
of yesterday.

I: Bus=0018 Vendor=04f3 Product=30ce Version=0100
N: Name="ELAN1201:01 04F3:30CE Touchpad"
P: Phys=i2c-ELAN1201:01
S: Sysfs=/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-5/i2c-ELAN1201:01/0018:04F3:30CE.0002/input/input18
U: Uniq=
H: Handlers=mouse0 event15
B: PROP=5
B: EV=1b
B: KEY=e520 10000 0 0 0 0
B: ABS=2e0800000000003
B: MSC=20

Full boot log:
https://gist.github.com/dsd/cf411da3f4b84bfbc3871bd7915a7bce

The touchpad has ACPI HID ELAN1201 and HID ID 04F3:30CE. We've worked
with other products with the same HID & ID before, so my initial
thinking is that this is a platform-level problem, especially given
the newness of Amber Lake in consumer products and similar bugs that
we've faced with brand-new platforms in the past.

The touchpad works fine under Windows 10.

The touchpad is probed via ACPI; the _CRS provides an I2C device and a
GPIO interrupt. The GPIO interrupt comes off a controller with ACPI
HID INT344B driven by pinctrl-sunrisepoint.c:
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise
Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
    Subsystem: ASUSTeK Computer Inc. Sunrise Point-LP Serial IO I2C
Controller [1043:18b1]

When using the touchpad, interrupts are raised and then
i2c_hid_get_input() will read data that is not in the form you would
expect...

- The 16-byte input reports are almost always duplicated. That is,
right after an input report is read, another interrupt arrives and the
exact same 16 byte report is read back again.
- After an input report is read (and usually for the 2nd time as it
gets duplicated), between 0 and 4 further interrupts arrive, but the
i2c request here returns 0 bytes of data, as if the interrupts are
spurious
- Especially when holding your finger on the touchpad for more than an
instant, within the data stream there will occasionally be 16 byte
input reports read that are entirely 0xff bytes

Is there any awareness of issues like this on the new Amber Lake platform?
If not, hopefully this mail acts as a useful first step towards a solution.

Suggestions appreciated!

Thanks
Daniel
