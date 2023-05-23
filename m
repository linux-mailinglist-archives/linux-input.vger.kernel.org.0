Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C2570DD2A
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 15:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236301AbjEWNHX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 09:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjEWNHX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 09:07:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F263DB
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 06:07:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 80F0963221
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 13:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207ABC433EF;
        Tue, 23 May 2023 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684847240;
        bh=smcT/yEx0wRVQexJ9FYsCvpEgMqn42JxWNWezhW5eAI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OSXLDwa9Ag4rTSNonXwgVEWUD1ssFDD0TjFU+T7H6n4Jz/myGQ9zdR2duKvcwXdS3
         /zfqa4gjueVPj/6Ar57yj+2OJc73I83Phf6laqXPO7VLP3otWa7IXNntNO+UZ2C0MM
         1dEJrjyVlHZOpdiyAWer/EQwfMIzSNAAlCeP4P5k7ds0/unibCanrwAaHG7nVJIcOG
         5LvZ408GLvLArbkX7ZLbRSZWKq04DRg0BL7GQ2wyMwoMjp00piPl7LwzhBHOmST/m1
         nqZ6dKlgEBWSwjmDMPf/rtNomp1xxkPNF7OF0Nhnub4/rv752VGLLUVfV/1my/E9h8
         2BwF+fUqOH7BQ==
Date:   Tue, 23 May 2023 15:07:16 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Check for string overflow from strscpy
 calls
In-Reply-To: <20230414182210.383218-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2305231507070.29760@cbobk.fhfr.pm>
References: <20230414182210.383218-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 14 Apr 2023, Jason Gerecke wrote:

> From: Jason Gerecke <killertofu@gmail.com>
> 
> The strscpy function is able to return an error code when a copy would
> overflow the size of the destination. The copy is stopped and the buffer
> terminated before overflow actually occurs so it is safe to continue
> execution, but we should still produce a warning should this occur.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Now applied, sorry for the delay.

-- 
Jiri Kosina
SUSE Labs

