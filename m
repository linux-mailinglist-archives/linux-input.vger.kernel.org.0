Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0F8530AA5
	for <lists+linux-input@lfdr.de>; Mon, 23 May 2022 10:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiEWH3A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 May 2022 03:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiEWH2E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 May 2022 03:28:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA2913E1E
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 00:25:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D2FDB80EF1
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 06:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3802CC385A9;
        Mon, 23 May 2022 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653288488;
        bh=LHam0OEKcyZmwb6eDquhebLlQH+9sqBjyB2TaxEWG9c=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ner3yg2X6cSR5wr3Qs5UbC0orjzxFm3UTwq07aVQqwOM9UvLY7v1mxxutRF0sR5jK
         mqHIysi8DLIOmkUINHKWaUqPKq6NVrrafODBBn+vnnGvXsW0jKnURJkvwfR+vv14MN
         9ojCb3NxVPRaw/h526/Vb1Q+3C3iMqlhXAYVzVWjEuw+i7/yknmdmnVxeYlNKY3r9F
         ai8Px1jQzD+APbNh7yOo4mGsRuK+vNToFAFxxKLHPvu0gqoet3H6jL55o6jJUD22Vn
         NNnuxyGw5VjihuxqfTT3LGQLTwV6RCBduwykviknq+LDyMvHe1JmRCV65njqh3jMVc
         +DnLJfc44W7yg==
Date:   Mon, 23 May 2022 08:48:04 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, Aaron.Skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH 1/2] HID: wacom: Only report rotation for art pen
In-Reply-To: <CAF8JNhKCNsk186mrQz7mVCsT4nFrby5povog1gKjnve7XPvp+w@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2205230847181.28985@cbobk.fhfr.pm>
References: <20220513215156.14914-1-ping.cheng@wacom.com> <CAF8JNhKCNsk186mrQz7mVCsT4nFrby5povog1gKjnve7XPvp+w@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 May 2022, Ping Cheng wrote:

> Hi Jiri,
> 
> Sorry for the noise. Both patches in this set are bug-fixing. I forgot
> to add Cc: stable@vger.kernel.org in the patches. This patch (1/2) can
> be backported to 4.9 or later; the other one (2/2) can be backported
> to 4.14 or later.

Ping,

thanks for the patch and the explanation. I however don't seem to have 2/2 
in my inbox; could you please resend? Or ise the 1/2 a mistake? (the 
previous version didn't indicate it's a part of a series).

Thanks,

-- 
Jiri Kosina
SUSE Labs

