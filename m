Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CC2671895
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 11:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjARKJf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 05:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjARKGY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 05:06:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F0569B29
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:11:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77BFEB8164A
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 09:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A00C433F0;
        Wed, 18 Jan 2023 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674033116;
        bh=ME0uHqgfTif+hN/57UWd/O92dCQxUCC7eg6fpwvBCMg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=P9/i9WZ1f380g36jTFZy1AuvqQPx+hnI7XZbzkzeZiToy4/lIy2WM8OObmNgen+xG
         oOePymmAPwfO7h66X2FyWuEVbFdoSbd0Kr941ZNK8lZBytGRIBcmeP8OwaLPQxHlVx
         /JgxnidT7ShFbKL8beA98xYY7ytghNgBdTVzNZNQ6Yuf9sRy/ykyJ6I4xrEo4lcxnS
         AAIwAjmcdTMzhRyyivjI82j/oVP+1Mn2qrAaDCvqBU5fyVwUCmJOS4U9x1Cu0Cun+V
         VCraKNIhwelh3hH4YjEG5guY+O7cIKswWLpcHj7H/Sq5KrvwKY1DGmMhcNjecmXal+
         qg5X34995prTw==
Date:   Wed, 18 Jan 2023 10:11:56 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Abaci Robot <abaci@linux.alibaba.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/5] HID: playstation: fix DualShock4 unreachable
 calibration code.
In-Reply-To: <20230106015910.3031670-2-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2301181011490.1734@cbobk.fhfr.pm>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com> <20230106015910.3031670-2-roderick.colenbrander@sony.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 5 Jan 2023, Roderick Colenbrander wrote:

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Reported-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

Applied to for-6.3/sony.

-- 
Jiri Kosina
SUSE Labs

