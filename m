Return-Path: <linux-input+bounces-4829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BE926A6B
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A6D3B249F5
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDEA19412C;
	Wed,  3 Jul 2024 21:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQvhQMW7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CCE1922E6;
	Wed,  3 Jul 2024 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042687; cv=none; b=boR4cKjLZMT3mq4y3T8Xjn6zRmSb3dyBczqZ9Qn6sM8Hw10M0G9pDTdx2FzwE42NZbsLWrMDMDcz7QsPqTj4Nf7l79jTuXS8/1nUUyfy6GgAwJ16MSS25RN6mpgjmAJxTQNNGMvKPH0QxD2z9u/19WsXy/CxrqSwbgVpUXR2XyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042687; c=relaxed/simple;
	bh=BONk33/AjAGSGztBN01Llz+bvuigLFZn2ylEa9P744Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSQmJc4f15Q7EdyOfxbImmeAl+sCwTpqjZAoH3UjarqMXTt3LYOoqzQNZN4XP/7i4p1WT6Mu7nO08+WsJPsCPlVlKgBxXhexGgLfWCzv5gNUmD4PwtgouSTvqZ/ctIWzyLc7hdFd6Eebu4gaJOnRmSy5lyRo/f0BrkMXCb0M5sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQvhQMW7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-706b14044cbso11896b3a.2;
        Wed, 03 Jul 2024 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042685; x=1720647485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCQMPZmb06REgC0YmgoqxpHW3s9jThgGXNQXOTn5GAw=;
        b=KQvhQMW77WhnGBK0tmcF1MKvkkC/e3cIN8xI5FprembdCvOlx2vVoxg/8bpNA0kKlL
         DR9j0mlF+Dg+c/EpCudozwz4YpdGiAa8VlYvlFPdmxFgowiG0ezVpcOwGfTj9IwsDAw5
         hDNnmCLyHbacMFI85n3Y/WIeWPDBQxvO5AnkseiQDiUK6WI20nZsUa4MmKPxD/H0NAhk
         LLrBlceWAlarLKiXOhhcuRprN6bT0uSLdmL04DYCQARJNBSUEMsqJvbQWTRWmeLrdqk1
         vbHi38eaZtv7Mn5BglfA9RPM0ZlJJaAtO415/yt7v9WSZEhYOZ10mzHOJ5ublzy990Le
         xC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042685; x=1720647485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCQMPZmb06REgC0YmgoqxpHW3s9jThgGXNQXOTn5GAw=;
        b=ryqC1S2+KmXlLsOnCfy+gK+D7st9/shOtFaUzC/rs7uJGHG6SEWmBXsZl9nUYARirL
         f82XfroKkwTPAW+yT4rC4Os/imq6EIV91xJIAt05gJjV5VqujmmO5xbt2VpUcQlU0uOU
         jFbOKOX7c1MosJmztsCHMs4+JOpP6PcsOI0xDIdNnV5seTvZLsyJhq6M2MBn/o9Qoyxp
         wWmX+qIU6jX+dtD5FsR0/nMFvgVIRK3/oUJhszmRozyzC5vJ0SbIHQBgsCUgD4t7zb/J
         Pqsgl4XNA8jyIMmIoUUCF5TO1kh7Nh8dojvMY6V4HjhzJIFleh3l+jR5VkZA/1UOMg3e
         APuw==
X-Forwarded-Encrypted: i=1; AJvYcCXw0F2xB8h+Iyv840sdnOddQHs8ggN60WDGBuf74wANZP6exUyoC4fKAK9fzk8GsQO+CiiNTpXwn76ABMdvQAFfNAd4xrA7Z0LEYyC1
X-Gm-Message-State: AOJu0YxkRXeLN3AGcrEq92cKYMzSrX9vIS3aMu/h+kxGxEvp8pWbMzBU
	fiDAWCf9ic/R8Fdw7WjS+F6vbpH+artvWrzEp/PFNSsCXmPOHop5mmnNKw==
X-Google-Smtp-Source: AGHT+IGjITzPJ8ppIyp71JajgXaEzPHuqWL4BnrXsBCF8g5jG+iEmgVCDTxlbk9vYq9VMTWqWVhwQQ==
X-Received: by 2002:a05:6a00:80f:b0:705:c029:c9a7 with SMTP id d2e1a72fcca58-70aaad60533mr13636282b3a.15.1720042685058;
        Wed, 03 Jul 2024 14:38:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Simplify event handling logic in input core
Date: Wed,  3 Jul 2024 14:37:47 -0700
Message-ID: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series tries to untangle somewhat convoluted logic in the input
event processing in the input core by realizing that input handler can
be either a filter, or a handler that handles a single event at a time,
or a handler that can handle a sequence of events, but should not mix
the 3 behaviors in one handler. This allows us to reduce both filter
functionality and single-event handling functionality to batch handling
and have the main event handling path to only deal with
input_handle->events() batch method.

v2: addressed comments from Benjamin:

- added missing patch to remove evdev->event() implementation
- allow not specifying any event handling method to satisfy kgdboc
  handler
- expanded comment on order of running input handlers when passing
  events
- split pre-allocation into 2 patches and moved removal of count check
  into 3rd patch.

Dmitry Torokhov (7):
  Input: evdev - remove ->event() method
  Input: make sure input handlers define only one processing method
  Input: make events() method return number of events processed
  Input: simplify event handling logic
  Input: rearrange input_alloc_device() to prepare for preallocating of vals
  Input: preallocate memory to hold event values
  Input: do not check number of events in input_pass_values()

 drivers/input/evdev.c |  16 +--
 drivers/input/input.c | 230 ++++++++++++++++++++++++++++--------------
 include/linux/input.h |   7 +-
 3 files changed, 163 insertions(+), 90 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


