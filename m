Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96860364C36
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 22:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhDSUtd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 16:49:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242619AbhDSUro (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 16:47:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5A5D613DB;
        Mon, 19 Apr 2021 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618865139;
        bh=EDj1gHlZSzYdYf98LrWwBli/46xSjlYyncHL60ccxE8=;
        h=From:To:Cc:Subject:Date:From;
        b=n4e/cACLrXR9fL+SusuHUrUJmxENYhHr/Gc/cr+a9Ey7vujZmMR+HPNhKJS7qR9CE
         D4ata9YB6FBZmBmYSvEYRrkZ/qGb6nravcOb89RNuxvfHWWFBPvXx4fngsSkH6R9Rz
         HLN535MJu1ZLTBFWVXcVvwVETwQPE0kxvK/bxW1SVmD8TFCyVr9maXJJut9/xNFLww
         lblx1ZA+YhyRLNaROVsS1AvPeRgpBU81qU+19eD3OMd/rtYk/PAuoPX6S3h4LRkH4w
         htKkK1jYn0NhCtaXWk8s0sE2TjrHIxF045FAaH0Ty3sTS3sJwvtkazbhrHaXpmoFT1
         gOgxXqebVTYYQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        TOTE Robot <oslab@tsinghua.edu.cn>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 01/11] HID: alps: fix error return code in alps_input_configured()
Date:   Mon, 19 Apr 2021 16:45:26 -0400
Message-Id: <20210419204536.6924-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jia-Ju Bai <baijiaju1990@gmail.com>

[ Upstream commit fa8ba6e5dc0e78e409e503ddcfceef5dd96527f4 ]

When input_register_device() fails, no error return code is assigned.
To fix this bug, ret is assigned with -ENOENT as error return code.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-alps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index ed9c0ea5b026..1bc6ad0339d2 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -429,6 +429,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		ret = input_register_device(data->input2);
 		if (ret) {
 			input_free_device(input2);
+			ret = -ENOENT;
 			goto exit;
 		}
 	}
-- 
2.30.2

