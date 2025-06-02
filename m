Return-Path: <linux-input+bounces-12677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DCACA8AF
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 06:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C605F3AC5A6
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 04:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E622AD2F;
	Mon,  2 Jun 2025 04:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOLebKPf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7D28FD;
	Mon,  2 Jun 2025 04:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748840229; cv=none; b=GJIStuDTtCHNcex616jia9uoi8i5B+WX3itdn9DMcQqTP311ardB+eVxngSSawkSBjzihKmdsIj0f3ZKRtPr7M06SbJPX3w0e6nEN2zP+pMOumyWTgzp/nEhwHeXB4ssPSZ4HhLYWKQjbVhIqdGLhkLzCzySMe03fq+RmIG+1u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748840229; c=relaxed/simple;
	bh=8tf4NHoPkxojwqp/bqU49+0BgL/usYY4ksdhsekfjsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m16MhzRnA/tDlKSB4Anp7FvFUiQrWFFPs72whmRm0n9K19TJwEjiP8HGKWzbmTKyPf0sG8MmD6fpmh3Mcs2h6qBcLro/NO/pyqQujeXieuZjUy+tMFiP4VDiRb3XNZLbu+gN4KS63DF3ZAaPEURKuPp6VzjpvfqC2kevMjlPJRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOLebKPf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-312cbedfad1so151128a91.1;
        Sun, 01 Jun 2025 21:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748840227; x=1749445027; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzdRILFfcu+nKbj9w2LI8MdQrrGUJNbw5VXz7kRBX4g=;
        b=bOLebKPfjnpo6qGOwuI49C3MlijiIwl4TS8t64rZ1GZK1bkKfQOi5EcRnGG2nYefCz
         IVW48xBrEI9MgrgMbpzooHcBS4RKohgcTl4dXH8l4umZE5JuC0PkY8iaUfAYz8jFcl0s
         RcgYmdYU6vscXNIt/C2HVaYfmekioZz57CGk90jVWF5mAuGSJU4jj+wN8HksKRTev9Wy
         ZXqCZuFBsCWNH0405fp7k11exA7qN1z1wQ7ay8n/+s5+xRPLAjWW/Uq/qE79Fn1qJ4ze
         +1lp2KhEu4Wvu4e7QXEyxDP2kEaqAlxMSO8e+gaXqhAnCsQL1IZM0dtyt1yLhrvxIpVv
         xv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748840227; x=1749445027;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzdRILFfcu+nKbj9w2LI8MdQrrGUJNbw5VXz7kRBX4g=;
        b=wSpmsu+6crGDJtPvTPQ0ina5eHHGh4Tun7/j7msQBfYdT7CJoWqEqwcKTLfynf6hmV
         JVHbuxntWWJ8yvndg85hUQHMsGQJCjWaWD/Is/kq4fyKu+HYjwJN+CCqMOK8PuoyVRtH
         miCQvegUbGvpLWg9gucT+1FOEMInuYuXn2Y7SEQfFh1htS2Ptfw2m1HJMu/xuyytRP5m
         608bLR8qKkWO7Ktfp+vqVtSBVTdQwhFSdwik2Q6NjK1NP9yZ0b61vCljIDQmpGHGf9aK
         iLkr2xA12X+kjnNmQLHxM1DltJXPvV8y/u9je8tMLsRj0c3MAzs/6EZSF0t/xk/5P+A7
         qp8A==
X-Forwarded-Encrypted: i=1; AJvYcCUaRFnAe2mlHEMrDHWB9SWbitshyN5HZ1nfNxw1T2h5Szqbd4UE8GIYvuVjalXiuVFX68ioL0Tne+SuhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB/JC3dTOlxIp1NBmkP+63jIaNv5KfaWQ69D6PxhpvR61JiwCX
	f8cYGWbjCRQ3H5taSVjaHts6Z7+h7HwH9TGslr4S5L3Jn/bBT7exGnT3
X-Gm-Gg: ASbGncv0c2LvC94d6TMvEPgTw//qJCmFP8Qjx3HD3eloUG4Fo+NSxENCQHVeKZ4QVPH
	wMysuuQFlTFghIBGUo9ujON7Lz9Qsp2lZJeTeF6KanFrGwh0kjH8VoLIENHMCeBNsvMXgtqsHvy
	/xqvm/SrichxCxY1d1n85RJb955As/IeHF2fj5/Plz4bBcMDr1Gu/kGfVj72Q38vggWxdhATwu9
	n7uqCZAhJAUYldVhxIOgVHjwM2nlSO8MEL3hZCanCBksJQZtnG+XGs+LqyDjKSEstyGVr2wmMrD
	ekMW3aWeuuvsiGM15QulLqFrIpg25TIdeqNXiifzdALPMb7XEsr1bm41WpR8JA==
X-Google-Smtp-Source: AGHT+IGxWbm3SMba0OSEf8KgqgUVVOlpBdin6u7lHmN2kR2fqhdqDzqp9Bd3k8kEwtiJbdQiImy3fA==
X-Received: by 2002:a17:90b:264c:b0:311:1617:5bc4 with SMTP id 98e67ed59e1d1-31214ecdacamr22762635a91.12.1748840227126;
        Sun, 01 Jun 2025 21:57:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1713:e88:7435:d43d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c29b8sm4793860a91.13.2025.06.01.21.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 21:57:06 -0700 (PDT)
Date: Sun, 1 Jun 2025 21:57:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.16-rc0
Message-ID: <66fexopj4i5izpsalnoiqxy4ufbexlcax5yqs7iqvzdpdfjwww@6wiq5a6ubmak>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc0

to receive updates for the input subsystem. You will get:

- support for game controllers requiring delayed initialization
  packets, such as ByoWave Proteus, in xpad driver

- a change to atkbd driver to not reset the keyboard on Loongson devices

- tweaks to gpio-keys and matrix_keypad drivers

- fixes to documentation for Amiga joysticks

- a fix to ims-pcu driver to better handle malformed firmware.


Changelog:
---------

Dan Carpenter (1):
      Input: ims-pcu - check record size in ims_pcu_flash_firmware()

Fabrice Gasnier (1):
      Input: gpio-keys - fix a sleep while atomic with PREEMPT_RT

Gatien Chevallier (1):
      Input: gpio-keys - fix possible concurrent access in gpio_keys_irq_timer()

George Anthony Vernon (4):
      Input: amijoy - fix broken table formatting in documentation
      Input: amijoy - fix Amiga 4-joystick adapter pinout in documentation
      Input: amijoy - fix grammar in documentation
      Input: amijoy - make headings compliant w/ guidelines in documentation

Ian Ray (2):
      dt-bindings: crypto: fsl,sec-v4.0-mon: Add "power-off-time-sec"
      Input: snvs_pwrkey - support power-off-time-sec

Joel Selvaraj (1):
      dt-bindings: input: touchscreen: edt-ft5x06: use unevaluatedProperties

Markus Burri (2):
      Input: matrix_keypad - add function for reading row state
      Input: matrix_keypad - detect change during scan

Neil Armstrong (2):
      dt-bindings: input: convert dlg,da7280.txt to dt-schema
      MAINTAINERS: update dlg,da72??.txt to yaml

Pierre-Loup A. Griffais (1):
      Input: xpad - add the ByoWave Proteus controller

Qunqin Zhao (1):
      Input: atkbd - do not reset keyboard by default on Loongson

Vicki Pfau (2):
      Input: xpad - allow delaying init packets
      Input: xpad - send LED and auth done packets to all Xbox One controllers

Diffstat:
--------

 .../bindings/crypto/fsl,sec-v4.0-mon.yaml          |   5 +
 .../devicetree/bindings/input/dlg,da7280.txt       | 108 ---------
 .../devicetree/bindings/input/dlg,da7280.yaml      | 248 +++++++++++++++++++++
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |   9 +-
 Documentation/input/devices/amijoy.rst             | 125 ++++++-----
 MAINTAINERS                                        |   2 +-
 drivers/input/joystick/xpad.c                      |  53 +++--
 drivers/input/keyboard/atkbd.c                     |   2 +-
 drivers/input/keyboard/gpio_keys.c                 |   6 +-
 drivers/input/keyboard/matrix_keypad.c             |  30 ++-
 drivers/input/keyboard/snvs_pwrkey.c               |  25 +++
 drivers/input/misc/ims-pcu.c                       |   6 +
 12 files changed, 425 insertions(+), 194 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.yaml

Thanks.


-- 
Dmitry

