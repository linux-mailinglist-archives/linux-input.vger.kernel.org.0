Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE06F7E31BB
	for <lists+linux-input@lfdr.de>; Tue,  7 Nov 2023 00:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbjKFX4R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 18:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbjKFX4M (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 18:56:12 -0500
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA59D78
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 15:56:08 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 94150580B6A;
        Mon,  6 Nov 2023 18:56:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 06 Nov 2023 18:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1699314967; x=1699318567; bh=bf1u58r/Wc
        tWzA1e4xic5Ej2bNsRYaeGiLl8FNAwReI=; b=XhHlbF/DY3AFlpDkGWjfztOgyz
        3IfhaDyuTVCciJPRZN3BPXp50tsoOij/KY8OKqklLiCrEkbadN8KsQ3mFt0s91mq
        xI6xEj2/MoDxRHJbeftm7XvZsU5JXYzWWlamPU/HHD7xMTfH3AyzGyBsGfGCaD7Y
        BhHABULkVBd2O/uO/2orpBUJPLBjN2yRBhcvm870NkYeGmMKyWVUFEo+Vn5jByQr
        Dy7eY/4NEuYYgSwVnwk5EaZhuWcxDYyfF8xPX19JktuW0LZCOokQN2tjgD1b87Vw
        Yuqz+ludMSPi8Pa7LmliVlWEX5VM5cwnINQvkNEM5jN5sVH7zmIpbbV0KkgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1699314967; x=1699318567; bh=bf1u58r/WctWz
        A1e4xic5Ej2bNsRYaeGiLl8FNAwReI=; b=srTXlem5CXjRoWgnxkedtUTXMqKsW
        iEFwSVlyVvyigJOFDGQmEaRipP4kxCjgceJYLZ69+A+W+OAiZFrxghWLvG4jVMSM
        PskRS6reVgVBBvXrkNhB+auup/18b4gvgGbK6b+eEVK/Z5wLtVXRcckcnVFj9GW+
        ols4ZByO/RYYwK4qGQ5I+dU8THGEAzVHxSJ28xYNmnanKwK1bC+jdUTG5Ozrf5f9
        vssR4/Y8JIQ9qQtt3MA/7ce9uS5nw//HPza2a3yfUCImiN+FpCvVaApNlQoZPqb0
        kWv18KWaNmW/Y2g3xJW4g9a9HThbBk2c+ztSVkW/YW8QpB/4rFx/BjZ7w==
X-ME-Sender: <xms:F31JZbvdV35XJuCRxjZfKYusY4mbUZED8r4i8xBi35ZLDCDfmASfPg>
    <xme:F31JZceG-ZYPL8nu8yqBEi23Qp9Nw27Ul5wRmqsZ98uJQwZVyE_F8zM-JggDF5Y7y
    6i6UFcC1I2tuRFFB_s>
X-ME-Received: <xmr:F31JZeyEKUDhg9_ZI-4evx2Qd2kvQjO1bAX0-mJd0H5ayY2aK9gDHNWKPPmrKMXJ8ZL86y-HPUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeeurhgvthhtucftrgihvgcuoegsrhgrhigvsehfrghsthhmrghi
    lhdrtghomheqnecuggftrfgrthhtvghrnhepudekhfdugeehieeugfeitefffeffledvgf
    euhedvveegffeftddvffehledtudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrhi
    gvsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:F31JZaMMjRXknpqiFLglzjVqkgjMin5Uu4Rz6Oldwved9jxaTuwEBg>
    <xmx:F31JZb-X8CKzrcsfIhUjfLfa5tyngPGIER-NAnqGhL3QMns6d2LzKw>
    <xmx:F31JZaXSwA9CO8i1g7zeSm6lldOX7M-SYojohzExdKPA_CdhbYD6ZQ>
    <xmx:F31JZeYHMZ0rx49-W5RFjQahee6HbRDOUtj2MW7Q2MF79NEcjnDWyQ>
Feedback-ID: ice5149f5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Nov 2023 18:56:06 -0500 (EST)
From:   Brett Raye <braye@fastmail.com>
To:     jikos@kernel.org
Cc:     sergeantsagara@protonmail.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, Brett Raye <braye@fastmail.com>
Subject: [PATCH v2 0/2] HID: glorious: fix Glorious Model I HID report and rename vendor ID
Date:   Mon,  6 Nov 2023 15:55:55 -0800
Message-Id: <20231106235557.8741-1-braye@fastmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Glorious Model I mouse presents a faulty HID report descriptor which
prevents some of its reprogrammable buttons from working. This patch
series performs a fixup on the faulty descriptor, and renames a vendor ID
for consistency and clarity.

Changes in v2:
- Split vendor ID rename into its own patch.
- Link to v1: https://lore.kernel.org/linux-input/20231103011038.27462-1-braye@fastmail.com/

Brett Raye (2):
  HID: glorious: fix Glorious Model I HID report
  HID: glorious: rename USB_VENDOR_ID_GLORIOUS

 drivers/hid/hid-glorious.c | 16 ++++++++++++++--
 drivers/hid/hid-ids.h      | 11 +++++++----
 2 files changed, 21 insertions(+), 6 deletions(-)


base-commit: bab19d1b21547046b0a38dde948086f6cbcaefaa
-- 
2.40.1

