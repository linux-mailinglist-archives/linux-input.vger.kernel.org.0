Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC0F7A9812
	for <lists+linux-input@lfdr.de>; Thu, 21 Sep 2023 19:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjIUR36 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Sep 2023 13:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjIUR26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Sep 2023 13:28:58 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492A653656
        for <linux-input@vger.kernel.org>; Thu, 21 Sep 2023 10:16:46 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RrxJh534FzrSlL;
        Thu, 21 Sep 2023 21:36:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 21 Sep
 2023 21:39:00 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <jose.exposito89@gmail.com>, <linux-input@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH 0/2] HID: uclogic: Fix two bugs in uclogic
Date:   Thu, 21 Sep 2023 21:38:22 +0800
Message-ID: <20230921133824.605700-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When CONFIG_HID_UCLOGIC=y and CONFIG_KUNIT_ALL_TESTS=y, launch
kernel and then there are a user-memory-access bug and a work->entry
not empty bug. This patchset fix these issues.

Jinjie Ruan (2):
  HID: uclogic: Fix user-memory-access bug in
    uclogic_params_ugee_v2_init_event_hooks()
  HID: uclogic: Fix a work->entry not empty bug in __queue_work()

 drivers/hid/hid-uclogic-core-test.c   |  7 +++++++
 drivers/hid/hid-uclogic-params-test.c | 15 ++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.34.1

