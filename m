Return-Path: <linux-input+bounces-14692-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E88BBB5642D
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A05517CB51
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B37821FF29;
	Sun, 14 Sep 2025 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ8DDpY9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60FD202F8E
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757812844; cv=none; b=jFProx3F/zSrN32gLnSJf0LkXZRDpxg/lbggtWzv7oB/bBPiXjZUAe9ey9nZNXpn8nxrfqFYbIB4EESrclLJpBYgvAi/Pm8cAqjzl+KiTR4/+UkNqd3gOVpCB9kXe2wo38anThdQcW+YXiRRJpktnhw/2jkR8GR1w4k59TV6VWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757812844; c=relaxed/simple;
	bh=FkpJKDeauvQC6Z9YoUkrAnt4nd1U5i8M0RF3HkbD/5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SY3cWK2wi9602Nczpl6ftTYlTMLjZfJfWRbyC/Cs55xyj+ezDvC8jvpcMrzAQM0hxJxeKm6TRFCecsb7Ci5TxpgwvfbkKawsQg+kY8utsAMyCrNc2XZOG1P0wu1k7O+rh5D0+WOQ/tHGh45taFZzAZYNtdg8WGVMkcmcKtJNmNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ8DDpY9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so3961586a91.2
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757812842; x=1758417642; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4i6bDVD5hwBYMgRX2DgkJN197oaGlVqOUQIQ1shHYA=;
        b=cQ8DDpY9uxGPQijczXBBI+U6dFECAFLl3wOSVrCebZTU4q89sOs/e6EPXsSS9IbJUd
         CDDaEE4Q8lB16fYfGRxX5WzeVzM/ijKaT8OMfrwHSlIxwfXGFB1238U1v1c/8pk/gG7+
         VQEOgsYbPmy+xMXf0iq1fqFFghq6Dp9MvAK6GJJgrZ+aePzTKE9jmbPEogCBoret8C3J
         liW6nJtsbDe6ved6ZDh2VL9pqwGTZ9wy0EZZC2cwYhJ1/PN3m8Cu7EwTVq1Ejt0CSRmK
         jhYAq+hIST3zGxn1h040wRZpLrbIcovm0U4v1ZoGYmdBtuYB96GuOWHiojM7Fx/FaOoJ
         vdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757812842; x=1758417642;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4i6bDVD5hwBYMgRX2DgkJN197oaGlVqOUQIQ1shHYA=;
        b=hBr5ChxQe7Eb8pSuPCtdHd10dTX738TyhP6VqVXT0F53lWh/z4bKTOOlNOPrXYNEpP
         awA0SMyOH9fquAmMXt1o0VQwpma7ZZPBatEV302j6KDtOMwPQAMLE+0ClumOvFadJp8+
         i/j73t9JtWPIn9TuFJ3hHCfbSe0SPfooNhF3UCl2O/iuVeoezJXkzWf/lpTP3Hb3QTFZ
         vx163yHZiYMPvBSqTFHnEacCVPvsClhosTHEQRxMrHGdz6p0s+2F1KVQ1HqpOP1TglJ3
         4pB9hzPEXDQECZQmqFEn2rZGW5b2uHVMDGEtlGPVBTpmNH8FNTJmx4R2JuTxuw30uxMA
         zOJA==
X-Forwarded-Encrypted: i=1; AJvYcCXQM0J8OjhpQPx4u64FEcEEwbC8Qd1Z2UIlTZAtZiAA3TykTxNysUUphm/HRM1Lgy6oHybYx9GKFd3oWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuKZhvErwGaii3P7pR9rhCO+3vONXzOaFlSo9odVqUbk49Tdb
	H1UwNR+aB/nk+t2GUPZMxmKzB0v8h48BGQ65fBfoL1clDZRP+qXC49GEr/AxHA==
X-Gm-Gg: ASbGnctNbZq+7OAa0YEETc1aP374fLy1YkErYllp9oGPKTH3wCdETFD0+i4UdQT7Tyd
	3nnsmnIHjqG5uExUXThBqp1et9DC6unLtRBvPircXEIDFxOqZ1qJKloYAi0rX+cB5c+kelhZpNn
	h2l/tr9bbl7OFFlN/odyEPin8UkfNW+cQFutGx4yqBOWZ8XtFlcOiVci+5j7h8n8+ZpyK/6Tdm6
	BP8Dg4oFkP0VmdZi4DpAVYYH1pUz3tf5/zOW5lTmzzNYt/S5EfrAX4nP0cDlBG5yZIQZHV7okT9
	MfInKDgOMM0fcm6PxKCDAcYmRy221nd/NoXBW60Iuj6tZP4XQWBr3QENEc1lgafcnU66lBfx2AL
	eDRL9oW4wa8+5lowAAsL3WruIu78/OlnD
X-Google-Smtp-Source: AGHT+IGpnDRI201c71fNLQkFyHJumgspF2T5sIyMovVhhCFRDsFqRg0trRxQAB31uKyVOuiBxMFVMw==
X-Received: by 2002:a17:903:2c6:b0:24b:bbf2:4791 with SMTP id d9443c01a7336-25d2646f828mr100742185ad.39.1757812842046;
        Sat, 13 Sep 2025 18:20:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a7a0sm89268285ad.89.2025.09.13.18.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:20:41 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:20:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.17-rc5
Message-ID: <pr27r442uxseunxtnoko5fquveeb2qg7kxue7uht4marr45ais@ce4alsq7hatm>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.17-rc5

to receive updates for the input subsystem. You will get:

- a quirk to i8042 for yet another TUXEDO laptop

- a fix to mtk-pmic-keys driver to properly handle MT6359

- a fix to iqs7222 driver to only enable proximity interrupt if it is
  mapper to a key or a switch event

- an update to xpad controller driver to recognize Flydigi Apex 5
  controller

- an update to maintainers file to drop bounding entry for Melfas touch
  controller.

Changelog:
---------

Antheas Kapenekakis (1):
      Input: xpad - add support for Flydigi Apex 5

Christoffer Sandberg (1):
      Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to i8042 quirk table

Jeff LaBundy (1):
      Input: iqs7222 - avoid enabling unused interrupts

Julien Massot (1):
      Input: mtk-pmic-keys - MT6359 has a specific release irq

Krzysztof Kozlowski (1):
      MAINTAINERS: Input: Drop melfas-mip4 section

Diffstat:
--------

 MAINTAINERS                            |  7 -------
 drivers/input/joystick/xpad.c          |  2 ++
 drivers/input/keyboard/mtk-pmic-keys.c |  5 ++++-
 drivers/input/misc/iqs7222.c           |  3 +++
 drivers/input/serio/i8042-acpipnpio.h  | 14 ++++++++++++++
 5 files changed, 23 insertions(+), 8 deletions(-)

Thanks.


-- 
Dmitry

