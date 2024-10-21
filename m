Return-Path: <linux-input+bounces-7579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFC9A6436
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 12:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26917283375
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 10:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A131EE039;
	Mon, 21 Oct 2024 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTMoReVi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A23A1CD;
	Mon, 21 Oct 2024 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729507128; cv=none; b=p8RSE3nPWZLLkWbIRP3scxCEZ5AI5qi0dbbjb72fOSERGjBm5APrbFeDoeE24TScPUyBa0rNNt97zVvInwoDGoWz6gXG0EyFK4uvr2Ht+fQCUbQKOYTThFDoSPRzXm1b+Y2ui9ZJmX+tE45KmiFx+wSQIWRX3FVScUFGkCJXUAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729507128; c=relaxed/simple;
	bh=MTEIwWu3jTQU5v8lYnh4kZ6IrgWAb2spD2U2OYINDXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R52IGpkIa6DI0C6/odue+7LdyjSOTXCjJuDk6JoTRVbQz7RXetMXcNxeu84Gj/rxdL3No5ihUIS0z22qU9qB6dK8pCJEwEM4VxY1aPsUP02JKxX0JzIVVLUvVawldS94Ghsdukn5GdzxMVEGYm65AR6bWqBUQ/GHlbo9zGadaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTMoReVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F368C4CEC7;
	Mon, 21 Oct 2024 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729507128;
	bh=MTEIwWu3jTQU5v8lYnh4kZ6IrgWAb2spD2U2OYINDXk=;
	h=From:To:Cc:Subject:Date:From;
	b=BTMoReVigy7vuir9fQc4Vda/4t+YRI5HCmJeEh3UNX6Fyjsta4YVnPl+n6OwrQtYW
	 Nn54bsceOK09sYiY31M3t/SMQMJ1BSYy8f2Nlb9I/UOVOElNCWHyjc3d0V+3VlB0Zx
	 e+1YOpQOo+fCFKbftn//FRl8FqM6iqJ6qXXZ/c6VpGFTT4P9ZhkijE4nM6hdPIC5D7
	 6ENSLXh0l1llYxSxNh/+s2EJN3xfy8A6ELEaO3Dos3G+7SkCAg0sr+dhXPXGRRSIzS
	 hFWetzE225VqmjG2e0KHU9iJxk6me9qOoKaL3Oi048Gc5pYR1rR/IxQVsp7oUC/Zmw
	 u64R3GtSSZFEQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: serio_raw - initialize serio_raw_write() the return code
Date: Mon, 21 Oct 2024 10:38:27 +0000
Message-Id: <20241021103839.2828469-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The number of bytes returned from the write function is now
undefined:

drivers/input/serio/serio_raw.c:204:12: error: variable 'written' is uninitialized when used here [-Werror,-Wuninitialized]
  204 |                                 return written ?: -EIO;
      |                                        ^~~~~~~

Fixes: 5b53a9d40c4f ("Input: serio_raw - use guard notation for locks and other resources")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410201730.ItNhUTIv-lkp@intel.com/
Closes: https://lore.kernel.org/r/202410201759.qnyACw46-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/serio/serio_raw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/serio/serio_raw.c b/drivers/input/serio/serio_raw.c
index e058fef07f57..55fe77d04089 100644
--- a/drivers/input/serio/serio_raw.c
+++ b/drivers/input/serio/serio_raw.c
@@ -195,6 +195,7 @@ static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
 		if (count > 32)
 			count = 32;
 
+		written = 0;
 		while (count--) {
 			if (get_user(c, buffer++))
 				return -EFAULT;
-- 
2.39.5


