Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF1D7885BF
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 00:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfHIWUe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 18:20:34 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:41541 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfHIWUe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 18:20:34 -0400
Received: by mail-pf1-f181.google.com with SMTP id m30so46763975pff.8;
        Fri, 09 Aug 2019 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=yWau7YU+ZUfTifU715n6+E78gOBN34cf0QBHWjhMEdw=;
        b=h4wFQh0InRYXp9htTypd5kqsYpfnEr1mPy6ky76IydzSZV3x42JM7uS9twJNS8SoE+
         rGPDd6fIMiJVeR4ev2acQZLDqlYLDgN6yS23rNZ252XJI+8/1EaON6YDIXz1cQk75Js/
         E8zmnizSowVZ6wmSE6neY5K6XufkOlJs5j5G8CU1TeKom9+PpzY6IxJ9IzDChIT7HBNh
         fU9RoslRae1VCrqhDUvCI+904SC3E8c6ILPyWKw41BcKrVqMMX/o+mJT57HyAZ/hZ3Eu
         3XvP13jwXgyfbJcRPc+xzikfcYMPpFUZeEELqQwfr+fcLyYWbx/7E6mErTUSdLtu0FMC
         TgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=yWau7YU+ZUfTifU715n6+E78gOBN34cf0QBHWjhMEdw=;
        b=fuo63BT2SBvcGje1ZqLAQZXqcym0LpeBlTJtwjt1JDxCXiEE7KAjmgKIYAHJtL/89R
         cMQzsM1TD3YLE++mq1KhD3XrdJlp9j9XoQ5mnxR40kqxawneDuPXlHSBo4ltRYSnpuZ7
         /wdhp/I4OpRAVMHhZyFsLwv8Tv30kOq8AqQHSiNS62W4jbEdcoXaExW+vHsoD5ctwiVG
         YQ28pVBlpj288AeQ0dc7lcsfGXuipGmFJkqWUjAWYUEGiqy64Oy4kCPGNskSCPsd9rg0
         iZOxJmRLG9he/fpJIdu1D6j4kgnaAVzzt40RbTve30Shw7/hLK9czFVfoXMOFKUe+1Ji
         fu6A==
X-Gm-Message-State: APjAAAVlqZR/BFN1rHmsRrw9VmJ7kUVyHITR87966znUTHVui9dsoROB
        CC1n+tI7ZgAffSqZVjBpxS0=
X-Google-Smtp-Source: APXvYqyxnxOI3p+sxIoZEIOrWszQDrDcbW7VNAsQas0ES+giI17pJvDOx+oaXlfGvxtl0CdktwftAQ==
X-Received: by 2002:a17:90a:7148:: with SMTP id g8mr11705511pjs.51.1565389233037;
        Fri, 09 Aug 2019 15:20:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h20sm245256pfq.156.2019.08.09.15.20.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 15:20:32 -0700 (PDT)
Date:   Fri, 9 Aug 2019 15:20:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.3-rc3
Message-ID: <20190809222030.GA20442@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- newer systems with Elan touchpads will be switched over to SMBus
- HP Spectre X360 will be using SMbus/RMI4
- checks for invalid USB descriptors in kbtab and iforce
- build fixes for applespi driver (misconfigs)

Thanks!

Changelog:
---------

Arnd Bergmann (1):
      Input: applespi - select CRC16 module

Dmitry Torokhov (2):
      Input: elantech - annotate fall-through case in elantech_use_host_notify()
      Input: synaptics - enable RMI mode for HP Spectre X360

Gustavo A. R. Silva (1):
      Input: applespi - use struct_size() helper

Kai-Heng Feng (1):
      Input: elantech - enable SMBus on new (2018+) systems

Nikolas Nyby (1):
      Input: applespi - fix trivial typo in struct description

Oliver Neukum (3):
      Input: usbtouchscreen - initialize PM mutex before using it
      Input: kbtab - sanity check for endpoint type
      Input: iforce - add sanity checks

Ronald Tschalär (1):
      Input: applespi - fix warnings detected by sparse

YueHaibing (1):
      Input: applespi - add dependency on LEDS_CLASS

Diffstat:
--------

 drivers/input/joystick/iforce/iforce-usb.c |  5 +++
 drivers/input/keyboard/Kconfig             |  2 ++
 drivers/input/keyboard/applespi.c          | 29 +++++++++-------
 drivers/input/mouse/elantech.c             | 55 ++++++++++++++----------------
 drivers/input/mouse/synaptics.c            |  1 +
 drivers/input/tablet/kbtab.c               |  6 ++--
 drivers/input/touchscreen/usbtouchscreen.c |  2 ++
 7 files changed, 56 insertions(+), 44 deletions(-)

Thanks.


-- 
Dmitry
