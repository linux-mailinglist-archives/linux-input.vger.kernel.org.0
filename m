Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59245790C56
	for <lists+linux-input@lfdr.de>; Sun,  3 Sep 2023 16:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbjICOD0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Sep 2023 10:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjICODZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Sep 2023 10:03:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D9CB6
        for <linux-input@vger.kernel.org>; Sun,  3 Sep 2023 07:03:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 874D660B20
        for <linux-input@vger.kernel.org>; Sun,  3 Sep 2023 14:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6870DC433C7;
        Sun,  3 Sep 2023 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693749800;
        bh=XjjoMToY91JXQMw2TqvJCow/rz2iJGW+LSD50hIkdx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yo2DgscsVC5iZGLNXZDSWMD1SDcmkAfX8H9aHjDvpfMvw+eZ0kV925rX7B8RGOqMX
         PLQAVZAjZLroGir2sRP2/dPHhw+aZ4sobYxQkyZHBIqLNJqPIGPUsS8kkJL/tW8+fN
         eWVnin4FsFGZLiKw4kHBVRYurOaBznNm7xm9oeBs=
Date:   Sun, 3 Sep 2023 16:03:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH (repost)] Input: MT - use __GFP_NOWARN allocation at
 input_mt_init_slots()
Message-ID: <2023090355-rarity-emergency-b6d7@gregkh>
References: <aa0d1e42-9a62-698b-fa89-000ce397316c@I-love.SAKURA.ne.jp>
 <07350163-de52-a2bf-58bf-88c3d9d8d85b@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07350163-de52-a2bf-58bf-88c3d9d8d85b@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 03, 2023 at 10:55:45PM +0900, Tetsuo Handa wrote:
> Ping?
> 
> On 2023/03/28 20:25, Tetsuo Handa wrote:

It's the middle of the merge window, no one can do anything until after
-rc1 is out, you know this...

greg k-h
