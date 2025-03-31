Return-Path: <linux-input+bounces-11377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D06A762A5
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 10:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4EE3AB308
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 08:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ED91D63F5;
	Mon, 31 Mar 2025 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9Lk/tiH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58ED1D516F;
	Mon, 31 Mar 2025 08:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410695; cv=none; b=OgLhgwCR7yJb/GUD9aMoL3F1vEIgk3HBLqJmkULHTzkQFCoy4I47HlRXUdoq2YtFmcvCfO/+EAmgxiyuyWfMnYsnSPAAG917sJB3iB1SwaHx1DRKlWawBy1WGUgDJEzJdzWKOpNnY/T3W2mqSYJb2BHTYH9FI0goJe3iOOQpL5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410695; c=relaxed/simple;
	bh=xPjLy3lCize1N065HS3HgBDM13/nd2XQsFndYdiJbuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kxrAXkLEJK6fw2tl14YI0Bc/Krg4EtrNnSVJHHrl1g+Bi4disVnvranVodj3PEU/UfZRQEqqeVbT/Qad5MurIZhryN1ABsWJCZtL6uYfTpk4BW42jTurhXNbpODpn/dY86vOHSWT9aDXMUNTlBIdyaCivi1tgBtKvdhemDcVqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9Lk/tiH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5ea062471so832564a12.2;
        Mon, 31 Mar 2025 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743410692; x=1744015492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IA3rtWnjIty0CmGpBrPz9tTEDstRWRkH52VWOdKov/s=;
        b=F9Lk/tiHAlasUxdFgMocqrwbn5XvETrDy09Qa3ss1PAh4+ttTwCCKW+LnSNrK+WOzv
         ORq0DkOQ6D4xYId6OED86rNWNcSgG+TgzkJoRRlKBOyglUREo4udVWQry5ahA0JLc4u6
         8o+Avwnv/+xmgpX1CzGmi5IzNHbvNp8agO3EIoNw3oZG9/QP8/oJ0iWIcZIy4PC2vagk
         +tILVYaBO4EE0U6qWDUKuBH718rAZKHvayU9eX+s521msDT/c14ti9sEklf8oUdlUsxz
         oTde3dVRYYGZ9xKEaRY9EuWlTfnAQXEuldMSCzipwhuwWgR/nMokMRF7lG/8TagcE300
         jP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410692; x=1744015492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IA3rtWnjIty0CmGpBrPz9tTEDstRWRkH52VWOdKov/s=;
        b=tPRnIKZkG84meexLEaT+Bhu4blIyYverwgXYmw/vOm9XJzitG15WjwYL0/7TNjb4eS
         BkruSoK4524JUsSENDfaECjFNNcJrY64uG+J6X7Jg1gxjcX30cLbs8emNqd/KvyZh4nc
         j0BCSPagb/HMtQ3FQb1fuccO6YdhlXXhSPvle0d+HtFugL4tCUGvlGvd3ZNKGU6nY5cH
         KPQAcjKeB7dtZZYiyBzxfNO6ER7Ui4f03MHs01xmkuax6GF27E99yPisEBOltQPgEGds
         eYP9zEAqNiG44MOp1amD/eAqyP25e1YfiDacXiH0hH47oqgZFCm9d/3gA0SgSa8ChQoy
         KdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlSWs4cJP5FkjDEMDOJxHvjUWKejsBmwtIxgIK3o2SLS6/iWy68EBmYxlg751JoAJPqPea5D6gC29qVA==@vger.kernel.org, AJvYcCX+iwQl7Xs5Mv/Oi+26d+OCsUgT858zDIwznIQ8NJepvqhFxeAcOKNuyBxDNMdtPKWtTKDjWnsLKZ4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqsq34c2heWnNvuTs4HpCKdRA6VyWx4fQU3obAiWrirbtB4qNR
	TSOvgJlIJl85xTDqQRQNwlyo7dxoEjAKshaNe4G0G7lQZY+c/h0nVTa20A==
X-Gm-Gg: ASbGnctHcv6aKGmlONw5TPk8xpi6cmKQcp+maotEZZkdIoPHTc8zn4cOdDOopcL4RXh
	KPoYJZJiGg2syfxS56/0UKLGaoHQPeH2IcdTNG0FmwgoK98fZj44yGMSpo0YlHgBZDIw/PBi9kB
	q1L5lwantSDP5lVuxsjXR9nFE1oQKENooMIhO5PlBMVNdU+u26JcdK3bgWUcj69kri2lRk5dZbo
	Zo8gstt34UPZj3yZHKPA6Vvnr2cJB9zoVXkTffmpHXbUrEV0rqecROE98VeLlegQd5BEeOmC71Z
	/TfgwggTArhoz+G2kMj0hwS1ueBCkDWF65buLhH4iKUf5hz/BAD7TdAKmnxhdXCz58ooihgZNig
	XL5XcEzftJqxsf1A=
X-Google-Smtp-Source: AGHT+IEnL41HIxE+Zw9sm+aBbdgYm79s8GKLEpzH9Mfl4n5cA9WfibyZXZrmWJ2TSpY4WaBXjahsgA==
X-Received: by 2002:a05:6402:5193:b0:5dc:7ee8:866e with SMTP id 4fb4d7f45d1cf-5edfceacfcfmr2509626a12.3.1743410691920;
        Mon, 31 Mar 2025 01:44:51 -0700 (PDT)
Received: from laptok.lan (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e05d8sm5236216a12.74.2025.03.31.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:44:51 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/2] HID: pidff: checkpatch fixes
Date: Mon, 31 Mar 2025 10:44:47 +0200
Message-ID: <20250331084449.61082-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No reason to write too much. Fixing errors and warnings from checkpatch.
Made on top of for-6.15/pidff.

I apologize for not checking my patches earlier.

Tomasz Pakuła (2):
  HID: hid-universal-pidff: Fix errors from checkpatch
  HID: pidff: Fix checkpatch errors and warnings

 drivers/hid/hid-universal-pidff.c |  3 +-
 drivers/hid/usbhid/hid-pidff.c    | 46 +++++++++++++++----------------
 drivers/hid/usbhid/hid-pidff.h    |  3 +-
 3 files changed, 27 insertions(+), 25 deletions(-)


base-commit: e2fa0bdf08a70623f24ed52f2037a330999d9800
-- 
2.49.0


