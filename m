Return-Path: <linux-input+bounces-6614-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2B97D19D
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 09:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F5C51C21A29
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 07:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB48814A91;
	Fri, 20 Sep 2024 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9RseNXJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B531420ED
	for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726816974; cv=none; b=EsJgQgwio56OnpKj/eRu0QQuacBYnpilziEN69YUEGGXKxiLL8dVg+1Kt9kfmrFx1ptxG3VuI6/zzM/w9JDmBSxuW3eDxNd4zE3YbVfVNkWweR5Y/YsZjBONNLOuexJ/wId65rEt2/yP/+JNugO2L4X88Av5uciEQY22NzAS8YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726816974; c=relaxed/simple;
	bh=I4RPQ0qLtx+2Ks6R9vPCgVZlHXp7UevMUdW6iFUZB5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u9WFj1xdfeSFFJFg1e2Drn35FMh3KCdLklgZHSgPqyMv1RtQ8OTT6KwjWcKUiv9h/j5HMW0yEEgLh4OjOQNGGkcq3r62RYm/QdPYqToO4ZbVONPtl7hJnOZs3CDkiayvPyoxs83yczMUNUR6z8VnGho7B8E6t1YHWwv9Y81kxGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9RseNXJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B936C4CECD;
	Fri, 20 Sep 2024 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726816974;
	bh=I4RPQ0qLtx+2Ks6R9vPCgVZlHXp7UevMUdW6iFUZB5I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=C9RseNXJ9b6fdDoocPPmxAlLAhqnJXrwwptACPZlFhp+dlYAzK0hX6GAe12eZMMgH
	 OQcr2o9cdj6EyZScgXxUutd3QLx3PThYn7cgWOLEnBuBpl7wJcYybv8bE5CjRsmtFG
	 Qd//C8IvFkhgKCoXvZiD0f7tEGgmYlj/LThuImEdM041cos4OQ/yHNTRsCHsm7N8Jq
	 C4yGOlKoI+HtoeCYcjYWtWWzu+eS+RShAZI7h40cqu4Sz5cpZfyoQ5+rDNFnN8YWZ0
	 rbfmtuzb8U+4lF6n6dnnr76d6ZQVu7oz/LybqZ7oHcR/V7O8wiaLzbxxaei9nvcQOV
	 I/uZ6VWBo+H7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E9FCF58E2;
	Fri, 20 Sep 2024 07:22:54 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 20 Sep 2024 09:22:52 +0200
Subject: [PATCH] Input: adp5588-keys: fix check on return code
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240920-fix-adp5588-err-check-v1-1-81f6e957ef24@analog.com>
X-B4-Tracking: v=1; b=H4sIAMsi7WYC/x2MwQqDMBAFf0X23IWYdjX2V6QHja+6CCobEEH8d
 4PHgZk5KcEUib7FSYZdk65LhvJVUJy6ZQTrkJm88x/XeMd/PbgbNpEQGGYcJ8SZK0Dk3dd9kIp
 yuxmy+Hzb33Xd+3/Mo2cAAAA=
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726816973; l=1120;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=3ebFrc8KerczEXKv8/mDft/LuDryKAXSlZYbDWCoHIg=;
 b=s93tWWSdAktDq+Spb4Ll1rtuu0fLfQkvB3BIhmcSzvVwZIp0w9Hd7N+zzrMSWix+1eBkE/KYX
 hEUunfOfBHHA3rjc/4YxOUMY4GG8oZSd8ovoZ8A76bJK6h14jq4EZ3B
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

During adp5588_setup(), we read all the events to clear the event FIFO.
However, adp5588_read() just calls i2c_smbus_read_byte_data() which
returns the byte read in case everything goes well. Hence, we need to
explicitly check for a negative error code instead of checking for
something different than 0.

Fixes: e960309ce318 ("Input: adp5588-keys - bail out on returned error")
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5588-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index b5f4becf5cb6f..d25d63a807f23 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -620,7 +620,7 @@ static int adp5588_setup(struct adp5588_kpad *kpad)
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++) {
 		ret = adp5588_read(client, KEY_EVENTA);
-		if (ret)
+		if (ret < 0)
 			return ret;
 	}
 

---
base-commit: 55bef83509f0cbe4cc54a583ac0313389dabee66
change-id: 20240920-fix-adp5588-err-check-6ee553b7b856
--

Thanks!
- Nuno Sá



