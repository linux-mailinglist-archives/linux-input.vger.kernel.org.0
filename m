Return-Path: <linux-input+bounces-10194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF2A3C29D
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 15:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 242EC1708E5
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 14:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D99318DB24;
	Wed, 19 Feb 2025 14:51:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FC81DA4E;
	Wed, 19 Feb 2025 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.87.242.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976693; cv=none; b=hU9ZscfhjYUuLQBVmJ9i6KwsHXAoQ9ePgYyFvvwHOog4W35Abu9BiaGkc0GGtiWRFCSxdrcgU5p4jTHYjzVi1srwhNUiUWAtzI03/frbOiJt0lZkypLtDTrWPaeMdg9epkylEMy/jlyrma/d0/VaBCZafBmgmbe9aHZ34khnuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976693; c=relaxed/simple;
	bh=J+GwiUIAf4Zl5aBThaRvLpOLV44yr5j5p0Eqe3SYLRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0Svylrn6+QlwuDAsNjfRcMzcUA9N0PpB71V0vMbQG142waZ1DkcVQWG+y8G8k96K6StrxwnQ9SzFaNXnMUjgSaTUtPMfzUQN3s8fLVxalm5165VOpgj+jsENHG0mDD/xTXKTkZNx8Ay4ZstN4QWMfKrH/TCrRXVawv+p3MAq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=77.87.242.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id 374FD180129;
	Wed, 19 Feb 2025 15:51:22 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: tomas.mudrunka@gmail.com
Cc: dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] Fix freeze in lm8333 i2c keyboard driver
Date: Wed, 19 Feb 2025 15:51:16 +0100
Message-ID: <20250219145116.209210-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20231215155643.705116-1-tomas.mudrunka@gmail.com>
References: <20231215155643.705116-1-tomas.mudrunka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi guys! Been a while. Is there anything else blocking this
from being merged?

Best regards. Tom

