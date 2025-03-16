Return-Path: <linux-input+bounces-10860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99894A6330F
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 02:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA8EC3AF8A9
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 01:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D0763CF;
	Sun, 16 Mar 2025 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIYl3MuV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DD318024;
	Sun, 16 Mar 2025 01:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742087906; cv=none; b=PS2xtcRDMffJHB4Iy/XJc45irTzMUysGvk2LVZa3kQaZuyiNu8FxBNO6x0eY8kiADyPJvtVrc73vht67PZr9i2OuKDu5TxwPiSU0zwaD9oNSj2KzvUqcEe+9daDK0HSyixAVHz1yR4AQsP9AFEqZb2BDzMnNeF15MAz0B4dxa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742087906; c=relaxed/simple;
	bh=FR4BAfAqRSJF647xGHiWbjKV9KTJlwYPqUqzXncZFJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+TWdY3wAX5gaUb73XAsr45SASjc7Aa6RTDwlyfzl598tB6SCsNdOL1kRU4NiwO/aboOQDbE2LI/j6/RDiEzIp2N/20zdRUZZgoF8f56pNKeiDPDt/fMRbTVSjuni9fG+npdNmjggCobXHbosOJMIJpj7GnMWCDgnfqaTqIjoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIYl3MuV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224191d92e4so62592655ad.3;
        Sat, 15 Mar 2025 18:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742087904; x=1742692704; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cSjt+tmC9IHZzjRkQR+eQSCX9XoU66Ykqk0J+mC1ik=;
        b=nIYl3MuV9YniQX4ED13ZdSGoWRyJbt8Dbsib3wrgiaG0jPAeQAxXUNPeDsM3E6S2gg
         u6u0U57vvBFVmYlF2RplvJpaVBbAZYquUGHXHSYkKCvEXlorA8rykbxn958O8LHcx3IC
         gPXzadHoIc6bBDCcw92DsEUivXllK9HWjiF1JLJ12ikykalBuzc6cHTKR78Cq0pLGb0u
         vWs/KtFJAZ5/rD3vK8Dml7Q1wawJAVavih6M9InCk9FvGSZBcHso+TnhvbJJNGrAVq0C
         YD+YQj+2hwMPDVc0mCr7XZY9E1ue4/yBRe4mjWo3iB2oVLBoNpY9FXMGhhio87nFUu4R
         cJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742087904; x=1742692704;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cSjt+tmC9IHZzjRkQR+eQSCX9XoU66Ykqk0J+mC1ik=;
        b=hEtIJ5AOMfJR1sqUy8me61QblfdF44aD1kOOtw2kRaBOo03YzRYrVlISKjCezk1bfu
         B8GpMCzg0xvXbPRZNnK46QPu4ibT6YpllYyc+YAIX3LpHQRpbb9IAr6oVrx+/EUJxSDz
         DjvJc1BZI99TKKOqCP74QkOalImc2SJ6qf2P6s14gB3F0WzZbaeShc9ved6AEbLMBpfw
         rqjBYH1xxs0yU1sac9GXWq8/1HgP7Cj4e0jSVUhc+8JjfmRl2lQ+gpfmyvBYvCBBOQFO
         iN9O87KyW9CpVGWrbJLe4yaYTi1dKbFZajT1e+33MWVbzSWTztrAazmqK7a+9Nx7EHUX
         jiEw==
X-Forwarded-Encrypted: i=1; AJvYcCWk3ghleFRAakwPxuTngVfMrS6Vd3XOpnXauR8hoBpGeVjBKa4kleZ+VNYzIvHEixsT4CbmNJZKEZ22Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz33oxaUOpxbq5QcJBMw7brypXbKd6NFiV2amCglvNTEnRT0wXZ
	PCuRsK/Cfk7HqAu8Gw9E3FEegkNWT5zb15iByxlHNwrqxTWWzDIi
X-Gm-Gg: ASbGncsjkgp7JecPl9GCLFe0uYfVU/6slZmTUyLXnYAf7ygB7rZNsP14HfVeRBgWUv+
	0/XBAKnupSty42dRFrMN8pjLotB26FhTD9ylBBpBmbtW6JFQcIFaea5VRpSY/tUmMgG6yZyjufr
	DiT2v0uUHLAYZUG++iucARtQb/cT+DPPHfYXnPQ7aSBUB25y7o1Zri/dHXGkpSNgRK/m5CqP7Rj
	xkWg57nHwgO0CPOIU3ISzfhOuM+/H/apekvGAVQp8VLOL0dY3GyEvRwRIBNtYRV7RproM5zraXW
	cTK6UJelPzVM/vt7oibI28Ad8JE0ssP5Rrm8eVHGq+7/nQ==
X-Google-Smtp-Source: AGHT+IE65S62rB3Jgo4wyNFrKsx70lqmZtblVsgPbjIj2VdOrOA7O6JoCAGVIqt1EdLt7B4+m84tOw==
X-Received: by 2002:a05:6a21:58d:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-1f5c114b9abmr10264427637.10.1742087904052;
        Sat, 15 Mar 2025 18:18:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:56d6:e54a:e07b:d824])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371169549fsm5181985b3a.131.2025.03.15.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 18:18:23 -0700 (PDT)
Date: Sat, 15 Mar 2025 18:18:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.14-rc6
Message-ID: <Z9Ym1Da9oT9CdxVR@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.14-rc6

to receive updates for the input subsystem. You will get:

- several new device IDs added to xpad game controller driver

- support for imagis IST3038H variant of chip added to imagis touch
  controller driver

- a fix for GPIO allocation for ads7846 touch controller driver

- a fix for iqs7222 driver to properly support status register

- a fix for goodix-berlin touch controller driver to use the right name
  for the regulator

- more i8042 quirks to better handle several old Clevo devices.

Changelog:
---------

Andras Sebok (2):
      dt-bindings: input/touchscreen: imagis: add compatible for ist3038h
      Input: imagis - add support for imagis IST3038H

Antheas Kapenekakis (3):
      Input: xpad - add support for ZOTAC Gaming Zone
      Input: xpad - add support for TECNO Pocket Go
      Input: xpad - rename QH controller to Legion Go S

Bastien Nocera (1):
      MAINTAINERS: Remove myself from the goodix touchscreen maintainers

H. Nikolaus Schaller (1):
      Input: ads7846 - fix gpiod allocation

Jeff LaBundy (1):
      Input: iqs7222 - preserve system status register

Luca Weiss (2):
      Input: goodix-berlin - fix comment referencing wrong regulator
      Input: goodix-berlin - fix vddio regulator references

Nilton Perim Neto (1):
      Input: xpad - add 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE controllers

Pavel Rojtberg (1):
      Input: xpad - add multiple supported devices

Werner Sembach (4):
      Input: i8042 - swap old quirk combination with new quirk for NHxxRZQ
      Input: i8042 - add required quirks for missing old boardnames
      Input: i8042 - swap old quirk combination with new quirk for several devices
      Input: i8042 - swap old quirk combination with new quirk for more devices

Yu-Chun Lin (1):
      Input: wdt87xx_i2c - fix compiler warning

Diffstat:
--------

 .../input/touchscreen/imagis,ist3038c.yaml         |   1 +
 MAINTAINERS                                        |   1 -
 drivers/input/joystick/xpad.c                      |  39 ++++++--
 drivers/input/misc/iqs7222.c                       |  50 ++++------
 drivers/input/serio/i8042-acpipnpio.h              | 111 ++++++++++-----------
 drivers/input/touchscreen/ads7846.c                |   2 +-
 drivers/input/touchscreen/goodix_berlin_core.c     |  26 ++---
 drivers/input/touchscreen/imagis.c                 |   9 ++
 drivers/input/touchscreen/wdt87xx_i2c.c            |   2 +
 9 files changed, 135 insertions(+), 106 deletions(-)

Thanks.


-- 
Dmitry

