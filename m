Return-Path: <linux-input+bounces-7980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E39C1C8F
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 13:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FEE81C22E0C
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 12:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320281E47CB;
	Fri,  8 Nov 2024 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTPpAulU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7538DC8;
	Fri,  8 Nov 2024 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067406; cv=none; b=nolmCNwH9H8ajLiF9m8cQoZSL59QsXRI79g1+90bp1V29SZSurix6/qne419Vl+QoRoBLllVa1V8sSJckSo3nfWKbSE35QADp22kxpEWvH5mYFey18HxaTL0qPuRbgK/NH4Bjvkx3MVSIcw+AiFYvzM5HLP6JumyJ3zsqlUkHOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067406; c=relaxed/simple;
	bh=d2ClGddYVUalvIae9odP6GH1vyoFqoEPShyX4IIA3H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A00npROZBZPv85rV1QpVq9xxntyrz3VSiAwarNvizFLau91lH6d3cy+ACPnQh/pMQ14lRCM0GweeoLXl2ZTs/m9/i09EtD3RhvE+qgjaSvY7wrXjLzERHEthaa20JVeyeDEjtx+vQEDf6nRHgCsBEkaDBUCWiQexEgl9ocnmgsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTPpAulU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e681bc315so1526964b3a.0;
        Fri, 08 Nov 2024 04:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731067404; x=1731672204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ly/UQDcrWoT1UpKfUCGcSlT6WIfa2v9SPuKffeJPFHo=;
        b=mTPpAulUq1w4nsNREmKxuhxqRNfEA8U0zAUcPPbvBLSQVtDYrKn1CDeLnpGwJWn3qJ
         zHMjMCx52B1BjfRePQuoPn5E/xEhpLqIgWYnAWDUTUWIrkwMxyK/6SIpbVkCBwuy6LxU
         CbC8JIvQwGAaBgxIG4nUVkiGD0Mob8PkhP/UoCxdo61upER0JS5IuVmTDn559NS56tbB
         ipYLbtQiwcBdKQ3CbIM2h6Tecr/eQFOaPAv3r/YTPWZ3iUmQH1IbWcuMfC/Anq6IjG4V
         0w5bChVa6xs40il4lLl2wKjhcnQ/jxQJSgykkHX751es4tLUvc4Sh16lVOiDnJ2noDvV
         D2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731067404; x=1731672204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ly/UQDcrWoT1UpKfUCGcSlT6WIfa2v9SPuKffeJPFHo=;
        b=G+6TqJu86kKS9jb+sB7gRPkMGrP+8Gta/aDSU4LJp3z764YUO5qZpYRpR3EhBg6gFl
         N5rGrsuMlf711F4hGq0txhNorFWzQRcL+hdE3HyaE3hyn5P6E1y/vfn+cA9Du6NgjF4B
         WyLoPNe9Xx2OMYleWicvLX7k+YH+bgjeHKULN+Q1AfQ+0bbfQ8rXYzmvL4tBKAVNjn9a
         fINlFifM+ni57QZDUk95qOdn219MMA2LtEdbVdxZyULs2doTwN1cOCbdnV8WVFONlspz
         NLXGpp+BHUQTANzxTknXaHUuK0rWoz16DrpWV8wT5oImQgyA0L2x3gW5KREq7n4dMVym
         qocg==
X-Forwarded-Encrypted: i=1; AJvYcCWfVdkGB8RrVyAqIQ3yp7r60PSsQVA15NWrK+rqp8+B/wNQ7TazWLjQOkja71Pv+If/7h/n6QGWxWC2DI5T@vger.kernel.org, AJvYcCXjJOyL6vg/mYxc2oCQlFDcfsiRR+Ay4ZCqVn/VPQVLkh9kNKobddyryxjPi5XM35xbdBitCyhS7HG7@vger.kernel.org, AJvYcCXy8ncmLNRKzC/pi7I+YrPYrULdeMl/XVyH3SU7HP9I9BA99YtUAYbNz01vGkDOBmGBhXq2/vl2zNbXnyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRTguCPmJhZkmKX8VjPLD5+deOVgu/PgdgGQYllE8bOXkpPXK
	FFeDztOTze8rAPPDVb3wQQmvBUPJdrX3su3g5HepQqEs7zrHeu0L
X-Google-Smtp-Source: AGHT+IFQpA1QPHJqoITlRVG/iQ2TjLAFz56BS9ZSChCMQZ8oXW8d/Z0ADgQu3P+UnKoPeqef5eI7pw==
X-Received: by 2002:aa7:8284:0:b0:71e:591d:cb4c with SMTP id d2e1a72fcca58-724121c7ba3mr4509273b3a.1.1731067403866;
        Fri, 08 Nov 2024 04:03:23 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a403fsm3579656b3a.105.2024.11.08.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:03:23 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: krzk@kernel.org,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v3 0/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
Date: Fri,  8 Nov 2024 20:03:09 +0800
Message-ID: <20241108120311.87795-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Goodix GT7986U touch controller report touch data according to the
HID protocol through the SPI bus. However, it is incompatible with
Microsoft's HID-over-SPI protocol.

The patchset introduces the following two changes:
1) Add goodix,gt7986u-spifw.yaml.
2) Drop the 'goodix,hid-report-addr' property.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v3:
- Split the commit into two patches.

Changes in v2:
- Change compatible to 'goodix,gt7986u-spifw'.
- Remove 'goodix,hid-report-addr' property.
- Change additionalProperties to unevaluatedProperties.
- v1: https://lore.kernel.org/all/20241025114642.40793-2-charles.goodix@gmail.com/
---
Charles Wang (2):
  dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
  dt-bindings: input: gt7986u-spifw: Remove hid-report-addr property

 .../bindings/input/goodix,gt7986u-spifw.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml

-- 
2.43.0


