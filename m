Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98707E24E4
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 14:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbjKFN0U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 08:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjKFN0N (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 08:26:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA81AD70
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 05:26:08 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE89C433C9;
        Mon,  6 Nov 2023 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699277168;
        bh=zC3Q2HufnSn7LPzP/lc+do0YbG56m5ZrBAXPx2uC5Ao=;
        h=Date:From:To:Subject:From;
        b=QIAiSuyqKrPzRYgL6na9oGKj64VinCUKPib9ubTd6PRNaWb/BPT8OgbY9hZCevujS
         /qKPXGOGJX67fLbMqM54MVv/Kj30zsJQCC6k6mMfe7qoPoNICxh3Oh8NMcc+vGDoDq
         7ifofcDDbGgKV+e9pNdzxfx+MXW0bDNR65nl5aVo=
Date:   Mon, 6 Nov 2023 08:26:07 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-input@vger.kernel.org
Subject: PSA: migrating linux-input to new vger infrastructure
Message-ID: <20231106-magnificent-flawless-gorilla-fc8b3e@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Good day!

I plan to migrate the linux-input@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
