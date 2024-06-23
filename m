Return-Path: <linux-input+bounces-4574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7206913F05
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 01:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D236281638
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 23:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B781849F5;
	Sun, 23 Jun 2024 23:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG0md7JG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D44085D;
	Sun, 23 Jun 2024 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719183943; cv=none; b=WdZNWPdQ4MStnzWykw/jC32Es8rYRllEj56ZTjcmwrsHiW7ROBQLwAE6IRrlkx0l65WLnbqFxOLsdLRgN0ATaPboAN6V0cDmimGip7PJLNp7WNZgupL8u5BP150LJLOCSt6/Gin1HjyPIDsQMv0BfymWCThaXtos5HSpPkIm98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719183943; c=relaxed/simple;
	bh=pCtVGKa1bI22Im+i/apmqa3auKGBOwgSimRM87zkmRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mx7D07xEoQhNs1Vder5WhH3gm7Ea3N//iC1sVrCKRMmY2Qj9NShf4hJMClYg2bnhx2n7luyPsfRyQ94PXWHGF2xe4zZ6HFLQ9xYkHz9vHi8+WHbvgZfrP/r5ktd51+e1nCYchAOf+OiqOQE4QjBpjex7HxQjpU/UXf8ThDl6JC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AG0md7JG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70685ab8fb1so220002b3a.2;
        Sun, 23 Jun 2024 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719183941; x=1719788741; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLg9SEFszAilsvw4KBn+fxL9F1S7W1/leMLlex75FfQ=;
        b=AG0md7JG6MP2kjqDHpNOLJLTYxXm9B3WiXVMPoiWmNiptrqsE+W7kX4oeDX0OSXYSo
         35IgDZk2osD7WO3ZH5h2VjxT92JKIEURGw/Xl9Sq5TE8EOeWR+iBIFDXpEuYMvgcTTOc
         barEZ/r0coTvqowMDpYSaPBTOOe0+HtRfGqQnFNwYbAZB9t2d4FiMBIrltPpXQO3LdLY
         N3TPCtHS/87MU1v3ShrfxikxGc71bvorRf99mxcouyFDyvIZh7b+EvgxCwwJdTbXaLzX
         Cz9g+BhsZJCRC0ALiuwdZDi8KALinwW78n1nDm7jkKeU7t6mqiCdDWoB5UvTq/U8ljKN
         Jerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719183941; x=1719788741;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLg9SEFszAilsvw4KBn+fxL9F1S7W1/leMLlex75FfQ=;
        b=AqxwCMe2pTwGLGaZ0EJQg4ARhTC48fyqiL9rI2xmRUvKMkosEvFVYOSg4GQN6GSkZT
         SSB+fRJhCoK1Lr2hCuWgj73v0+EQ7eNkQFft5cUkWxNvI+8l2o/Ki3Lw1bnekQTp46/Q
         Bm/fJX4VV26zjSAAJWv+kRVTq33O9WdVIe5CVusUZ/3baAcvB69Rb87dQRw6qoZzHyXl
         ZNP77Do7D7KTaRZBXvMCg+U7LF3i9sHiwFKPEFLcna4AU3Ho7oKESuk3G4Z8htwq2LPI
         3w3YAx9ZCHKiM2/Jcc7hf39wd8tSDFcattrWFVb3DJvXI743x++PoK/N5bs1zglalJPU
         zZyg==
X-Forwarded-Encrypted: i=1; AJvYcCUVnG2nt6Q5RZiS1einsV6xHZ7l9wFdIN1TUE2pxUkkDU6WHzgxpIFTbGHenHv76fIfEycKXw+CLxfqei+GbHQVgLWTo2JAQydWq3o=
X-Gm-Message-State: AOJu0YxXPL7NpZeYexlUBjHL3MToGzdZydlVENZ8e6AVqUnLIrkbgpN+
	YW4HWVhxMQ2FQUJnWLBUymafHxf6zScQpIfUkUrhLmQoHQhtrHFz
X-Google-Smtp-Source: AGHT+IFP2KJxeb4P0ucxbun4gImZFHaGda9VWKdVvnkdQ2ZtC6B+Xg6ct7SBnG08gbK2gWlwhTIqAA==
X-Received: by 2002:a05:6a21:789c:b0:1b6:3dfa:cc09 with SMTP id adf61e73a8af0-1bcf7efc84cmr3884384637.35.1719183941297;
        Sun, 23 Jun 2024 16:05:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c8b4:4b16:721a:ce0f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706513e98f6sm4923267b3a.162.2024.06.23.16.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 16:05:40 -0700 (PDT)
Date: Sun, 23 Jun 2024 16:05:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.10-rc5
Message-ID: <ZniqQuGkosZYqIYE@google.com>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5

to receive updates for the input subsystem. You will get:

- fixes for ili210x and elantech drivers

- new products IDs added to xpad controller driver

- a tweak to i8042 driver to always keep keyboard in Ayaneo Kun
  handheld in raw mode

- populated "id_table" in ads7846 touchscreen driver to make sure
  non-OF instantiated devices can properly determine the model data.

Changelog:
---------

Alexander Stein (1):
      Input: ads7846 - use spi_device_id table

John Keeping (1):
      Input: ili210x - fix ili251x_read_touch_data() return value

Jonathan Denose (1):
      Input: elantech - fix touchpad state on resume for Lenovo N24

Luke D. Jones (1):
      Input: xpad - add support for ASUS ROG RAIKIRI PRO

Tobias Jakobi (1):
      Input: i8042 - add Ayaneo Kun to i8042 quirk table

Diffstat:
--------

 drivers/input/joystick/xpad.c         |  1 +
 drivers/input/mouse/elantech.c        | 31 +++++++++++++++++++++++++++++++
 drivers/input/serio/i8042-acpipnpio.h | 18 ++++++++++++++++--
 drivers/input/touchscreen/ads7846.c   | 12 +++++++++++-
 drivers/input/touchscreen/ili210x.c   |  4 ++--
 5 files changed, 61 insertions(+), 5 deletions(-)

Thanks.


-- 
Dmitry

