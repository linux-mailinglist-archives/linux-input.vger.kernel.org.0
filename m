Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3948BDB555
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 20:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfJQSAE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 14:00:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42669 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfJQSAE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 14:00:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so2124357pff.9;
        Thu, 17 Oct 2019 11:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=5llPGiQesTZRbdQZS+LGFIWEO3rSCU/NACr08ZgLNjA=;
        b=CzfaisiVCNaVNalq0C+r17YG01hqWDcgSnWXfTb0t1WnHGaP3YbRAPBjXZpOVZBI1w
         Pn138x3tkDf7RDTz4b8CE51hfOlNaqyExppRHrMUMLL/4D/Yw12dAzi2Q0iuNIbDyzWq
         fW9hJTsP6NkBUXdab9UzuvOgY3uWonWuHEyxjFWrk5VJAEuxN2vz+yjBRfn8Xd9poNbQ
         KoDo6a8+ugw48GLG7y+LaVJGf2mlJCEsupYTni2apeby+c0n/d4542H+lrTlkoHkgOxH
         gS8sN0P0hHtd3JrJb5LozZZrjeN8oRzGA33HXl5uSq7zMwmN+49l8LaU/4rwFwaAVgY/
         nmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=5llPGiQesTZRbdQZS+LGFIWEO3rSCU/NACr08ZgLNjA=;
        b=tzvfugzqvdaXrQpwxV9U5izayX1zsz//agNlcKudkyIKq839A24IlzU5TjB2T8lWNk
         YKu+Q5QEPzCDpgGFiQXgzCiziZ7vP00yFMgSYYIur/hNo37ixmpoEJjFpVymCewpPxGp
         J4Wf5i2OPOHzbyluA1700BkPbn0XZRdQ3TBH0lfjWwGxEGM0URwdmt3sCHDW6XlqN/Eg
         mnN1p7u5uZn7by9TuGU4Ubdf+CGQDltRfVWpi+TLKQjWv0b6YOdPgSll2aJOxQ5gx9a/
         ncQyYCJxMiSb4HpgVLnTgfgehbcDn4csw27wxkl1JkFiTi9/rxBQPxII2Mi3uyP+G1nO
         Fcmw==
X-Gm-Message-State: APjAAAU23BRGSh+rycmUR25KH2mits9Kcm8Cam+dK/IDzrLtI95l3Pmf
        rgEDpykOLrPfA7iuODnOdosdpQE6
X-Google-Smtp-Source: APXvYqxHGLaWJ8OER5XtH+HG+t/nA2kXO/TwtrQD6rTV+iO4uPlrxaUp7qRPGBp0iRNVB7UHGaEuoQ==
X-Received: by 2002:a17:90a:304:: with SMTP id 4mr6016053pje.128.1571335202990;
        Thu, 17 Oct 2019 11:00:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 202sm3526050pfu.161.2019.10.17.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 11:00:02 -0700 (PDT)
Date:   Thu, 17 Oct 2019 11:00:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.4-rc3
Message-ID: <20191017180000.GA201965@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. The main change is that we
are reverting blanket enablement of SMBus mode for devices with Elan
touchpads that report BIOS release date as 2018+ because there are older
boxes with updated BIOSes that still do not work well in SMbus mode.
We will have to establish whitelist for SMBus mode it looks like.

Changelog:
---------

Evan Green (1):
      Input: synaptics-rmi4 - avoid processing unknown IRQs

Hans de Goede (1):
      Input: soc_button_array - partial revert of support for newer surface devices

Kai-Heng Feng (1):
      Revert "Input: elantech - enable SMBus on new (2018+) systems"

Marco Felsch (1):
      Input: da9063 - fix capability and drop KEY_SLEEP

Yauhen Kharuzhy (1):
      Input: goodix - add support for 9-bytes reports

Diffstat:
--------

 drivers/input/misc/da9063_onkey.c     |  5 +--
 drivers/input/misc/soc_button_array.c | 17 +++++++---
 drivers/input/mouse/elantech.c        | 55 +++++++++++++++++----------------
 drivers/input/rmi4/rmi_driver.c       |  6 +++-
 drivers/input/touchscreen/goodix.c    | 58 ++++++++++++++++++++++++++++++-----
 5 files changed, 97 insertions(+), 44 deletions(-)

Thanks.


-- 
Dmitry
