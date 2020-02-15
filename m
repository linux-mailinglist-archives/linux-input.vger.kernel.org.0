Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F339160118
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgBOXaB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:30:01 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35926 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXaA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:30:00 -0500
Received: by mail-pj1-f68.google.com with SMTP id gv17so5613725pjb.1;
        Sat, 15 Feb 2020 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=1OFKdKYOuEdt3GbD33I0905t17EPvxaa1y/xmesPAeA=;
        b=LKTKKo6IQMZadGO/lWGugOcSOQsBCVwuWaSL00B+WzZGXa6RVORH7E6H2P3P/pWKSj
         Yajivy3Gs8xpZimJQMOgDq9PPJBbGFQzNG6AecSC2hSOJzCSVfDjGKqkuX9fZ0mJzSsO
         vOauOqaREm/Gau13kqDxhdzxIU3uISOxylGrGnNGOEecJbA75dDeT7ISSL4xHFc3VafK
         JIOQWtPRmKa9to9GWVw3td//eMXLVbZ70jqdxvE3XdYMFaoNgibh9z09NwUbMeolGJQc
         rVwUJXrNHCjaLppPM9EujdrSNBqIa47NIJEe+tytVhGjkPfCEYTZce0pP5kb5ASEkvut
         3cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=1OFKdKYOuEdt3GbD33I0905t17EPvxaa1y/xmesPAeA=;
        b=RrqSch/I/4knqmnx2Bf6fBPtirNxolFYqnElvoknoIkGZS7//JjMYEgfmopR4lPXtE
         MVnO2Fy8z9dMZ2yS5QHo5ENldk+sAre5kARymij+/3WJomgKyd6GYyPLdpskhBwV+10F
         OWttFYKnm7DQIqwBl7S7gXEim0dbubXBYKf+IxbWKLV06E+Sxk0UHdacBB3pj13UjfLK
         6751Y+8+1RD6k32Hb+jT1Y7sllSNUxIxV1dcFnBCuyGyWTS/rYI9tqFthiSGjVjDNv5G
         ZVdcdYaG52hNhM/OrxjaS55dSsVWegwk6//0vYc2DuCUQZWSPWVMQLU2T09OOqdzUf4l
         WhDA==
X-Gm-Message-State: APjAAAVUVeLyLAORQHWTMHS5OSQoo0E/HluUGIJM15E9lOmT8vaMykan
        oOzawmiAjkZdUUheq3hJlvI=
X-Google-Smtp-Source: APXvYqy3Sorh9JO1ouujKisYYibaAI/Ueun1snCnmwz6mM/5l6P6pd+RxZInKrz/2BiNeliOOd3BOQ==
X-Received: by 2002:a17:90a:3188:: with SMTP id j8mr11494117pjb.82.1581809398294;
        Sat, 15 Feb 2020 15:29:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a17sm11114657pfo.146.2020.02.15.15.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:29:57 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:29:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.6-rc1
Message-ID: <20200215232955.GA107886@dtor-ws>
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

to receive updates for the input subsystem:

- a few drivers have been updated to use flexible-array syntax instead
  of GCC extension
- ili210x touchscreen driver now supports the 2120 protocol flavor
- a couple more of Synaptics devices have been switched over to RMI4

Changelog:
---------

Benjamin Tissoires (1):
      Input: synaptics - remove the LEN0049 dmi id from topbuttonpad list

Gaurav Agrawal (1):
      Input: synaptics - enable SMBus on ThinkPad L470

Gustavo A. R. Silva (5):
      Input: goldfish_events - replace zero-length array with flexible-array member
      Input: gpio_keys - replace zero-length array with flexible-array member
      Input: gpio_keys_polled - replace zero-length array with flexible-array member
      Input: tca6416-keypad - replace zero-length array with flexible-array member
      Input: cyapa - replace zero-length array with flexible-array member

Luca Weiss (2):
      Input: ili210x - fix return value of is_visible function
      Input: ili210x - add ili2120 support

Lyude Paul (1):
      Input: synaptics - switch T470s to RMI4 by default

Wolfram Sang (1):
      Input: psmouse - switch to using i2c_new_scanned_device()

Diffstat:
--------

 .../devicetree/bindings/input/ilitek,ili2xxx.txt   |  3 +-
 drivers/input/keyboard/goldfish_events.c           |  2 +-
 drivers/input/keyboard/gpio_keys.c                 |  2 +-
 drivers/input/keyboard/gpio_keys_polled.c          |  2 +-
 drivers/input/keyboard/tca6416-keypad.c            |  4 +--
 drivers/input/mouse/cyapa_gen5.c                   |  8 ++---
 drivers/input/mouse/psmouse-smbus.c                |  8 +++--
 drivers/input/mouse/synaptics.c                    |  4 ++-
 drivers/input/touchscreen/ili210x.c                | 34 +++++++++++++++++++++-
 9 files changed, 52 insertions(+), 15 deletions(-)

Thanks.


-- 
Dmitry
