Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFBE274236B
	for <lists+linux-input@lfdr.de>; Thu, 29 Jun 2023 11:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjF2Jq2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Jun 2023 05:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjF2Jp7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Jun 2023 05:45:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886772D70
        for <linux-input@vger.kernel.org>; Thu, 29 Jun 2023 02:45:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 065886150B
        for <linux-input@vger.kernel.org>; Thu, 29 Jun 2023 09:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC97CC433C8;
        Thu, 29 Jun 2023 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688031936;
        bh=KWnhBiQPSrqh5ntqwgx29FjHLcKcjRrrTrKPbbD4uCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hjic129b8gt0BYmO7/MF2sRo03xZm/TpqQ4PbE35WajZiS9KnZGlFVY4x+1VPPBR3
         xxDfK4cLP7WT+SKDM/fcAAC1wLlqF7bShoaSEK/G4luiE+hB+U4RBI4xeCvcEhXEVd
         QniDbVTSrCnO5oRVtdYa0etjohSYJgg/8ewsVs+4=
Date:   Thu, 29 Jun 2023 11:45:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonathan Denose <jdenose@chromium.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: Touchpad lost sync at byte 6
Message-ID: <2023062959-agreeable-zipfile-df6b@gregkh>
References: <CALNJtpUN+DrWtudWdKZxYMR7oM-yt926fj7_Wi9dUPLZybw-vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNJtpUN+DrWtudWdKZxYMR7oM-yt926fj7_Wi9dUPLZybw-vQ@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 28, 2023 at 04:00:54PM -0500, Jonathan Denose wrote:
> I am on a Lenovo N24 laptop.
> 
> When this device resumes after closing the lid, the mouse freezes and
> is unusable. After right-clicking multiple times the touchpad resumes
> working. I am seeing the following in the logs:
> 
> [ 1188.690138] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.699636] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.709124] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.718557] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.728110] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.975964] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.985456] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.994954] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1189.004443] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1189.013930] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> 
> This device has an ETPS/2 Elantech Touchpad. I am on kernel version:
> 5.15.117-19629-gf1eb3139d206

Why not try 6.4 and see if that solves the problem?

Has this ever worked on this hardware with any kernel version?

thanks,

greg k-h
