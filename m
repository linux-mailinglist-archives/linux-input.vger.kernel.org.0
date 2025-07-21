Return-Path: <linux-input+bounces-13621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97270B0CD49
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 00:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A781AA4369
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 22:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A89214A94;
	Mon, 21 Jul 2025 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+LhNwC7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D891D63E8;
	Mon, 21 Jul 2025 22:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753137126; cv=none; b=meQ2s7i+26sIimTNZNlAi+I5OgNT6V9y9B2jbX1lqOTArq8Mq7b7pelHbWST3Xvk/D/n3NuD9AYKFBa1e7GcJZ/sDiOq4WV3shuxt24Vep8vieD98xSJCEh9GyOtQHAt8iNgUpJxbFbC7F9qrPfEdxnOBwwvGt6hsBKMXMWKoWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753137126; c=relaxed/simple;
	bh=/hwTgfx4KFjY+QqMp2SWPHN97BhlYfGlgC7x4VhgChQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kPDsxbw9OKPZMs2/lmjC1NJi32PS11NweIDToKLho7SokuvzZX/8WEmNMXJhFSk9mE7ZIb9Y+lsGlPtudJjiQFBq9ki9inXN9L13P0GN3XBF28dTAmDDHzKheW4EnLF/5MM82Zs1qgAKlYipEjfFocIekPgQjCFp3lvyqfMHiDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+LhNwC7; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8db917573dso192246276.1;
        Mon, 21 Jul 2025 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753137124; x=1753741924; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hwTgfx4KFjY+QqMp2SWPHN97BhlYfGlgC7x4VhgChQ=;
        b=T+LhNwC72JIMLL1NxCjUyWj0AGOY+hPmRyIuZuqQJgl3N5lwz/nEHggWr2N6c02quE
         34NDPN7w+8/A7o70ixn1d9WZBr8NChfnlA0ywbF0qtodtUZR0UGCtUYA7Vvl4i5F/98D
         v1QY1XAI5+XTl8U6AvekkV9jhWGLThQ4MGwXN7LLyx5UcLVCazvxPBT8JnDFQsgw29QI
         7pO3B1lauivG3uxbltyXfAWXRBHfjvJ/ZS2oWB7oEwzAPnVMrSwbb79R7eWkI1yabuzb
         QA898Mn2+yyRN2frIBTq3Nf1M+YVTP88f6Ep8dXtn6iv7t1aT3q7T9wkCzM5JUps10QG
         2+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753137124; x=1753741924;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hwTgfx4KFjY+QqMp2SWPHN97BhlYfGlgC7x4VhgChQ=;
        b=fpbER9Wo+9FAU0fU9zX1dMfaRWpajGgNSQwaz1HPKGO5Z8dVjWIalhxRMrQevp3W3R
         qZIyCDZXXuXNN6WiS6gxuF8hmKs726xqm6qYbhrL8DnWwNRRFFG5aSq9l7HV6+fDjhvH
         R4uNNEc+Eh9+9PNr5F8lZcH54wseTkDIPC4Bfxk2X0RlikRhMVVvcJ2dREVeP1t9Gy/t
         BUAcPpmaw20D3Wxt5DMd4d1wKESXlEVAqKJgK3p2/yF6uOyvomP9Bxxr3Wqa2Bnv6VWu
         3D8OfnTOu9nyqfRU+OmbP2/6KW+f1OIpItEbbEITRRDkLGFyk+uUmZGeSaQpedmdont6
         +ryQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmU0p8bfCy4Yu9MxswIVtwS+h60BDSb7z5xJccpK3m1bECTefsPOr8tAHX8jEnnweaj6IXmzs+701KFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxBeWgziUqrT1dPLxl973VJ5aoD5SXZFMuEh+WJqlfIFZyJDpJ
	AbtABJdrM1zEZlpOejtiHeyiDGOI26ghlm6+6a2StYI+8K8MrW/Xc9XWbNUysHCCcBZIQNA174E
	0aBTbteIz88dTtwObuGBdIWWk3itqs1V7r/wLguA=
X-Gm-Gg: ASbGncu1Dq+53Ow3Tzig7vZZy/st1Lc5YzQ3nrZUHFn1YACj25VbdntY4tPDK+54WV5
	0jvYHDm6YTm+AFjsrYKA3BlDe7Pw89FIA6jZofan2lOpm5eJ6oI5FVOutRMkANQMvKiCaQMsk/U
	e1l7DfRFacVKIl+MRVjzxV2jQ9CcpojIe90LsxngV9i2OI1GYFEsir1xwwuWAU6oje0A8Ge3NMr
	E9S5x4=
X-Google-Smtp-Source: AGHT+IHbOJ1oijWHD5nDJ8dxDxRfCBM5v5sUdYx4NoCRqsicr0CIPZLX2jxwCd6P2OHuAw7ubCIuMql4jxvgJ+BmZB4=
X-Received: by 2002:a05:690c:4d04:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-71836c9e94dmr276751577b3.9.1753137124219; Mon, 21 Jul 2025
 15:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 21 Jul 2025 15:31:53 -0700
X-Gm-Features: Ac12FXwT9tPiTj0f1U3IZhiHRfEtGmqen8Iw-vKuK-_J4yJZzpJmQ2IoULTpcGw
Message-ID: <CAHQ1cqErtqZjSakSUppxKEPvK3xJYfKydM02RJTcDO0RV77r3g@mail.gmail.com>
Subject: dev->uniq is not unique for individual USB interfaces
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-usb@vger.kernel.org, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hey folks:

I'm working on a custom USB device that presents N battery powered HID
interfaces with each interface reporting its own battery life via
standard HID Power Device report. The problem I'm running into is that

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-input.c?h=v6.16-rc7#n524

assumes that "uniq" field of a "struct hid_device" is always unique, but

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/usbhid/hid-core.c?h=v6.16-rc7#n1415

populates "uniq" with iSerialNumber which is only unique per USB
device, not per USB interface. At the first glance the right way to
fix this would be to change how uniq is generated by usbhid_probe()
but that probably would break some userspace assumptions? Should this
be wrapped in a quirk? Is there a good way to add a fix to support my
use-case?

