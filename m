Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6EF676EAE5
	for <lists+linux-input@lfdr.de>; Thu,  3 Aug 2023 15:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236170AbjHCNoI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Aug 2023 09:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236778AbjHCNn2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Aug 2023 09:43:28 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AAE6582
        for <linux-input@vger.kernel.org>; Thu,  3 Aug 2023 06:40:33 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id BBEFB5C0209;
        Thu,  3 Aug 2023 09:40:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 03 Aug 2023 09:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1691070029; x=1691156429; bh=dxFJ75l9zv
        KwaPDeX+MUMOnSl2XsToePGxI1NXMrh4I=; b=AvG/S9CHl26Y4CseCc9n3hokY/
        RF9mjgOJLykTmB9VqYdJ6/Hz7RaO42C3ZbERFFaE/GKqlOkHo6Deju4hz0IAr1wy
        im0Ncg9U136qUxIunavCF0cIAoGNoY79ZxX4ODOCC8DBZ7KWheLBJ8QTSVUaGFfl
        KBROk/VtSnt6k6y394FAK/KVr6d25imv8pRnNlPm6gwb72rEo/wg+2NaqV3ob4oW
        Sn6dw2QnfL7MrAboklUSrlxzV/XYp+0T3AmFR6CO/lJCOMqZSPLHfo4TnIkuQ+fV
        aUdRsX84XkH4EjkxJlaI/ZICcClRTrqxYsOVmnS2ERcSXjJJl3xN35ywGgEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1691070029; x=1691156429; bh=dxFJ75l9zvKwa
        PDeX+MUMOnSl2XsToePGxI1NXMrh4I=; b=iZqGzHAgi0XQktzeMWUQ8oRFXT+am
        wv6HWesWA1NptINo9WtFI6vZRefJKVtbIIsjf94CyBgnGEa/mU/w7LtzjtJ9v79m
        zd0b+qit8507wqXui7IVFW+SzziVzRAR/M7HZpD4JgiOE+PyJzLE8JDwt/SF6pJc
        SikXUmD1LvTSQtJ6HUXnBpQdZ5FF6JVxBlaM8jBZvvcagPFjPhdiYbPtNb7lbVdV
        idndPYXXz3ruCQtjWiHg6LuO6AYWD3a3ilUBAmAREAXjeBjz6mJ88T968TfvD6Jh
        CgRpDhNeddxWxXKbXdAse8ycHs68KTw3CZgw69qJ3ujj2UaC/JrK9kDug==
X-ME-Sender: <xms:Ta7LZP5Vb48bB1ITkDIxp6SKLcGikV89Nu4o4hkrHlke6TdQsAe_GA>
    <xme:Ta7LZE7tx-samhHJG4ZCx5_wS2E-YkadoyAacF6mjytVTbNkx24s9SHBc0caYmNvf
    3eHuzgAMzQRH-o4XEw>
X-ME-Received: <xmr:Ta7LZGd2nGJ64zmieTSDGgSUE5h0x5OKkkoYOouuQhQhAMBlpKIeiu8Gsj6ld271K52aDwBccvdMNj_vaLt6ueDGACgSBm5ii2UocE4GP05emhlkKxTLK30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkedvgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucft
    hhgvihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrf
    grthhtvghrnhepkeeivdeggeehleeltedujeejhedvfedvieeiiedvteevvdejhefgkeet
    gffggeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epuggrvhhiugesrhgvrggurghhvggrugdrvghu
X-ME-Proxy: <xmx:Ta7LZAJg1kxJv_kv9Ho1wLmAMuwZlcvFXhNdb2_GaYiQeZnfP1r4LA>
    <xmx:Ta7LZDJxpMvq4Rt_Q8nea04ntvykK1ge4vHxskmUUJM4TXWLRdnm5A>
    <xmx:Ta7LZJy6tangs_H0owiCAhiC2ZvMsl-hCndmYGPzX-jJ8NaJEi2wgQ>
    <xmx:Ta7LZKWyhYnCmW-VRuOG-6wGNi4wYE2MpnJidc4JX3NBBnO2PeRj2w>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Aug 2023 09:40:28 -0400 (EDT)
From:   David Rheinsberg <david@readahead.eu>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        David Rheinsberg <david@readahead.eu>
Subject: [PATCH] MAINTAINERS: update my email address
Date:   Thu,  3 Aug 2023 15:40:01 +0200
Message-ID: <20230803134001.754936-1-david@readahead.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update my email-address in MAINTAINERS to <david@readahead.eu>. Also add
.mailmap entries to map my old surname and email-addresses.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 .mailmap    | 3 +++
 MAINTAINERS | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 5dd318121982..0ed8a8674a03 100644
--- a/.mailmap
+++ b/.mailmap
@@ -139,6 +139,9 @@ Daniel Borkmann <daniel@iogearbox.net> <dborkman@redhat.com>
 Daniel Borkmann <daniel@iogearbox.net> <dxchgb@gmail.com>
 David Brownell <david-b@pacbell.net>
 David Collins <quic_collinsd@quicinc.com> <collinsd@codeaurora.org>
+David Rheinsberg <david@readahead.eu> <dh.herrmann@gmail.com>
+David Rheinsberg <david@readahead.eu> <dh.herrmann@googlemail.com>
+David Rheinsberg <david@readahead.eu> <david.rheinsberg@gmail.com>
 David Woodhouse <dwmw2@shinybook.infradead.org>
 Dedy Lansky <quic_dlansky@quicinc.com> <dlansky@codeaurora.org>
 Deepak Kumar Singh <quic_deesin@quicinc.com> <deesin@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 53b7ca804465..b671495df3b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21798,7 +21798,7 @@ F:	Documentation/admin-guide/ufs.rst
 F:	fs/ufs/
 
 UHID USERSPACE HID IO DRIVER
-M:	David Rheinsberg <david.rheinsberg@gmail.com>
+M:	David Rheinsberg <david@readahead.eu>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/uhid.c
@@ -22922,7 +22922,7 @@ S:	Maintained
 F:	drivers/rtc/rtc-sd3078.c
 
 WIIMOTE HID DRIVER
-M:	David Rheinsberg <david.rheinsberg@gmail.com>
+M:	David Rheinsberg <david@readahead.eu>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-wiimote*
-- 
2.41.0

