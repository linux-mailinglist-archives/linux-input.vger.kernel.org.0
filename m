Return-Path: <linux-input+bounces-16524-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B39CB2231
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 08:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A711300646B
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 07:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF68299AAB;
	Wed, 10 Dec 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvGVhbag"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0EF19F48D
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350222; cv=none; b=K3JkzC1jNB7GrbntZpRJBrjkAgdHLjogtvamt4X9Xan/fQ+jsM9MAG0GYvrsBzf3VMm8l0fZlL0/ZkLIs/zMr3U+XPvPGAvPYRMxMZSuqJZfx82GYQoG6SSi9/NK04jDzWUHGd/cWf652fOp4iR1s9vgtBu6XYy6MtKQlprdPPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350222; c=relaxed/simple;
	bh=PBem9iSPXxrcC+UsyKfgnONLjpiUYiJ7t49tf/GeryE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/rWU1qzqTQSJkQ3wd99uZqNCjx+LEBNkfeMYhdlgVBaGKh1qrL3nrvSvMqSjg1Numn1bAlAklqIV/2Q0c/05TNwTWDas5xVk/c9bFqpnuZczLy+oLipiiCD16b97AzrInJPL2nPi3OqDhfOarltIbu3TURgv8l+6JObNjzO/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvGVhbag; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2984dfae0acso114946375ad.0
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 23:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765350220; x=1765955020; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kg2EHB7J8ucALD2o6TlTQGLCloUuNRSs6e1Com1j9fQ=;
        b=TvGVhbagL081Vm116Sb0Q0yzf4zZrUrBlz/RsE4DqxQJp7aswyteXVQ9JsrTtXVXnt
         FmX7Si4aG26AAivULTHgqrbaMUj9iWJ/densAuDcnNT7vqrwv68jQrp/lm9jcuG10aw0
         3rXmnRTJIO6WVPRjo+Vo/0aH+cldZvjXttt19ye/li/iTHvpar9z44pIwOXUBvQcCBzD
         kZ9vyoIcPufHtb5KevVkuk9ThazhHqWe24GqjznjtOwtBY57YOvKKgsqBL0gDEtKKG16
         U4gKgjjX/OMMClDZZqhniK1xkJcmVk56xj2H3Yw4wdd4DwptOXLK/Bxjf549clYQRXN4
         Cybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350220; x=1765955020;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kg2EHB7J8ucALD2o6TlTQGLCloUuNRSs6e1Com1j9fQ=;
        b=cjoXc1GIa1piMUfgnlIJgToi11m1o6JYM4Jr49mQ0/JNqPzGSxfZ0B8m+M1rh5XYk8
         uuc5Y9sX7JJG85blFHXoo70bfwcZFpgqYYMQNQRbx4ekcP1UbDKaehxEt4QjKjXcYgUL
         Mo3r1ePrhiQuEhqyk9t2XPZwZvAwadeXh+8LsCOoDoUeZ7SwtasMTufY4yQaGvBUHDN2
         7VX+vSznlbGDbCqW/lbIt+QIb4mTl+9KBVr9aqHdXVRnwVt7udDbzWSvUI1JhupCVagW
         5rqDb8EYPqivCz5IA11CNDGFU7ri/NcrE0WndqBsE80qxHHVSetdcieOqvpJeyN1JA9G
         kgHA==
X-Forwarded-Encrypted: i=1; AJvYcCXfJiyir9tpcXZR5TcEfWZ0UCgAmd05ymfpM+dSPTu2m1CKW8SX76MVcExnncPIgjQ1R6IOgIDPcZfsmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5kIIqnknqljDtuZLrmsIMKa4drk47uQTfWxROsFYlRXBlQtI
	wyQKohQ2cDLiL/+35KCrE14ZP5hr6lgfBFEsm9yRXgaTy5z9v5RGK/J7
X-Gm-Gg: ASbGncupP4GXU7flSXSjb5SJ0upwMdMkCTpjDoMP4LHbKZ7B34DFMNBmQLJsgvvhTQT
	gNB3ZmjFIWPSPGAN6wRn8o3LJ6HOQOjZL+O+8DyR8/cbsnYn1af+NJckpguC3N0aG3kJ8DIdKK2
	ldW1LQTT4UBebIWuwpUD+QAh9FdlRVnj+o7iSzWB814sNSU/2XTbc2RNEhK1ldnrgDyolue9Ql0
	nE6XTj0IzyTHEr2oX7JY7NrmYu1FCdogrgT+Bi1VDxp4ECPdruEicBhvi07ZLQO31GZDVuU754D
	9uPEd76jDM5fJgGMKLfipKpAOgHmOiQFZwZaIRR4SNWD1q+ZyGCPqSVuR5fjYszdnDiEpGc64W4
	fQSGd3jstI0gUerZVO6Qch2DhKXBaklgvNl2sTX7YDCwzRAHk+VRxAfRX+VsqNTtLZBSONXo5ra
	uavwuY2IFNxe6ON68aWJz920c49UN1YzfPpLhnzD2KQS1FOzwWJg2A
X-Google-Smtp-Source: AGHT+IFAUm7yrWmkzDDGL7x6+wiD9na7cOOq0DBog8E9DBB+wIe5Kguy46cKgwErYctKwec6AGE8ZA==
X-Received: by 2002:a05:7022:f004:b0:11d:c049:2fa3 with SMTP id a92af1059eb24-11f296cb541mr1110605c88.30.1765350220073;
        Tue, 09 Dec 2025 23:03:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:205a:5a0a:c468:f44f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm73350187c88.5.2025.12.09.23.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:03:39 -0800 (PST)
Date: Tue, 9 Dec 2025 23:03:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.19-rc0
Message-ID: <ahdv5kw3t7sz4ilpxmle2aeh5pswv3nellocrxnuearvnx2jfo@6wvkgcur7akw>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.19-rc0

to receive updates for the input subsystem. You will get:

- DT bindings for Melfas MIP4 touchscreen controller and TWL4030 keypad
  have been converted to the DT schema

- simple touch controller bindings have been consolidated to
  trivial-touch.yaml DT schema

- memory allocation failure noise was removed from qnap-mcu-input and
  zforce_ts dirvers

- ti_am335x_tsc driver was hardened to handle invalid (too large) number
  of coordinates specified in device tree

- a cleanup in Cypress cyttsp5 driver to use %pe to print error code.

All in all a tiny pull request this time around.

Changelog:
---------

Ariel D'Alessandro (1):
      dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema

Frank Li (4):
      dt-bindings: touchscreen: rename maxim,max11801.yaml to trivial-touch.yaml
      dt-bindings: touchscreen: move ar1021.txt to trivial-touch.yaml
      dt-bindings: touchscreen: trivial-touch: add reset-gpios and wakeup-source
      dt-bindings: touchscreen: consolidate simple touch controller to trivial-touch.yaml

Jihed Chaibi (1):
      dt-bindings: input: ti,twl4030-keypad: convert to DT schema

Junjie Cao (1):
      Input: ti_am335x_tsc - clamp coordinate_readouts to DT maximum (6)

Ricardo Ribalda (1):
      Input: cyttsp5 - use %pe format specifier

Xichao Zhao (2):
      Input: qnap-mcu-input - omit error message when memory allocation fails
      Input: zforce_ts - omit error message when memory allocation fails

Diffstat:
--------

 .../bindings/input/ti,twl4030-keypad.yaml          | 59 +++++++++++++++
 .../bindings/input/touchscreen/ar1021.txt          | 15 ----
 .../bindings/input/touchscreen/azoteq,iqs5xx.yaml  | 75 -------------------
 .../bindings/input/touchscreen/himax,hx83112b.yaml | 64 -----------------
 .../input/touchscreen/hynitron,cstxxx.yaml         | 65 -----------------
 .../bindings/input/touchscreen/ilitek_ts_i2c.yaml  | 76 --------------------
 .../bindings/input/touchscreen/maxim,max11801.yaml | 46 ------------
 .../bindings/input/touchscreen/melfas,mip4_ts.yaml | 56 +++++++++++++++
 .../bindings/input/touchscreen/melfas_mip4.txt     | 20 ------
 .../bindings/input/touchscreen/semtech,sx8654.yaml | 52 --------------
 .../bindings/input/touchscreen/trivial-touch.yaml  | 84 ++++++++++++++++++++++
 .../devicetree/bindings/input/twl4030-keypad.txt   | 27 -------
 drivers/input/misc/qnap-mcu-input.c                |  2 +-
 drivers/input/touchscreen/cyttsp5.c                |  4 +-
 drivers/input/touchscreen/ti_am335x_tsc.c          |  4 ++
 drivers/input/touchscreen/zforce_ts.c              |  3 +-
 16 files changed, 207 insertions(+), 445 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,twl4030-keypad.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/twl4030-keypad.txt

Thanks.


-- 
Dmitry

