Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094261CD1C3
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 08:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgEKGSx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 02:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728030AbgEKGSw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 02:18:52 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACF5C061A0C
        for <linux-input@vger.kernel.org>; Sun, 10 May 2020 23:18:52 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id d7so8350488ioq.5
        for <linux-input@vger.kernel.org>; Sun, 10 May 2020 23:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7oIFzuxdVOAtxzNvwTGL/4Pb77Z8pU1d84FVdM8qruI=;
        b=FSPDfMsGo/ye/nv+hjDrpV00F2DW41q/i1AR0ecyOeGkVooYsV6Y+ihF+zSy4qiQWP
         yYBImvVt2mGWtbt/47811bUGOFuTzXyZer0RGmGnB3Y4EfrA5xLoINjaSQ0KljYxjmPA
         8jVFf24IXzfBEv+DMXDbzhm8KBxqXk26cAAUPHX1z/1J5t6CV9RABhDZYDG3Jn6oMAs6
         zoIncdm+F28VEBLa7qmErYMfQXOm3IqhXVYt3OEsS13stohUffjCBaskB92uZOAdgHrU
         N9YDkJQKh8bfHhrt7tsbA9JBJLVXLIibkKeIjS7Mp2E8gQMJ155kNSWZtliTfoeFQ/oW
         aPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7oIFzuxdVOAtxzNvwTGL/4Pb77Z8pU1d84FVdM8qruI=;
        b=f8pRsGJwp+NMMzInu8Pj6faHaZaV5FODDXwDCKrV+l1KM9NvV1cjXzgeDPli4/hQhk
         EQaP2p6ftmJdzh7P+jJmziXkeZ2JheUGdBsEo/jRbr7kcw/vAeKBfWHn3DO3J9QOQCGm
         eYpsWDXQLdggBQ7IwORlvMZgm23YqJ/d1EIJ5zvnRT0dSS8A0HIFV5/SHVOcOL0yu/FX
         rAlcAZdeRMiIR1GlD+ZGi8w6hnw40vKJejIB0PGUSU3uZkaz3a0AhP6wn6bAZL3v4iUp
         hMLuvx5JypTmIRgMmFbXBhR72iDvNO592+ftumEsYqkjKbnNFUy3l4NiQtQSEfdaUThp
         UrlQ==
X-Gm-Message-State: AGi0PuauY1ZaziB6l5isY0TEHSTEIwx73R7xBXfCuBnWTFZebjVJYjy7
        PSFqkF5kooZ9rnV+HBJWLmHOsD6q6VIFvo8Se40THduX604=
X-Google-Smtp-Source: APiQypKkoSj5Aso7rkGkirjXr3vG3FwWvMDeT7AUAGPN2HTRNuecORBz4hYfyuJtw+qEzLstnD6eqlT5a9GzXdVQfPQ=
X-Received: by 2002:a5d:84d4:: with SMTP id z20mr14122569ior.36.1589177931744;
 Sun, 10 May 2020 23:18:51 -0700 (PDT)
MIME-Version: 1.0
From:   Yariv <oigevald+kernel@gmail.com>
Date:   Mon, 11 May 2020 09:18:15 +0300
Message-ID: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
Subject: PROBLEM: Apple external Trackpad event timestamps are jittery (regression)
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Using a vanilla installation of Ubuntu 20.04 (kernel v5.4), the
timestamps of input events from my Apple "Magic Trackpad" - 1st
generation, connected over Bluetooth - are jittery.
This is a kernel regression. I bisected the bug.

- The problem starts with upstream kernel commit 3b51c44bd693 ("Input:
allow drivers specify timestamp for input events"). After that commit,
the same timestamp is always emitted.
- This was partially fixed in commit 4370b231d100 ("Input: reset
device timestamp on sync"), however ever since then the timestamps are
jittery.

The problem still exists in the current upstream 'master' (commit c45e8bccecaf).

The following patch fixes the bug, however this is obviously a hack.
It effectively reverts commit 3b51c44bd693:

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 3cfd2c18eebd..8890195547d6 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1958,7 +1958,7 @@ ktime_t *input_get_timestamp(struct input_dev *dev)
 {
        const ktime_t invalid_timestamp = ktime_set(0, 0);

- if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))
+ // if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))
                input_set_timestamp(dev, ktime_get());

        return dev->timestamp;


Reproducing the bug
----------------------------

I used the following script as a reproducer. It relies on
libinput-debug-events. This script measures the time delta between
consecutive input events, then prints a "histogram" of these deltas.

#!/bin/bash

# log file name
logFile=${1:-~/Downloads/`uname -r`}
echo logFile=$logFile

if [[ "$1" == '' ]]; then
  echo record

  # log some events
  sudo libinput debug-events | grep POINTER | tee $logFile
fi

# process the results
lastN=0
for f in `cat $logFile | awk '{print $3}' | sed "s/s//g" | sed "s/+//g"`;
do
  echo "$f-$lastN" | bc;
  lastN=$f;
done | sort | uniq -c


Steps to reproduce
-------------------------

1. Pair an external Apple Trackpad over Bluetooth.
2. Run the above script
3. Move your finger in circles on the external trackpad for a few seconds
4. Press ctrl+c

An example output of this script before the regression
-----------------------------------------------------------------------

      2 .010
    371 .011
    127 .012
      1 .876

The above output means that: 2 times the delta was 10ms, 371 times
11ms, 127 times 12ms and 1 time 876ms. This corresponds well with the
Trackpad's ~90Hz polling rate.

An example output of this script after the regression
---------------------------------------------------------------------

      3 .003
     12 .004
     16 .005
     14 .006
     21 .007
     16 .008
     20 .009
     13 .010
    359 .011
     47 .012
     20 .013
     17 .014
     21 .015
     14 .016
     16 .017
     15 .018
      2 .019
      1 .020
     38 .022
     21 .023
      1 1.060

I suspect that other input devices might be affected as well.

The bug was reported downstream at
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1876449

Please let me know if you prefer that I open a corresponding issue in
the kernel bugzilla.

Best regards,
Yariv
