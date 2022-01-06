Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647DE48651C
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 14:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239210AbiAFNUE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 08:20:04 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48808 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239461AbiAFNUE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jan 2022 08:20:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 913CBB8210D
        for <linux-input@vger.kernel.org>; Thu,  6 Jan 2022 13:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0F2C36AE5;
        Thu,  6 Jan 2022 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641475202;
        bh=EAaTuxGi+ly0tVQt2WnZjG01L0C+/rm2FeNYAjtvLx4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Qyr1nWHfYj3ipGoNRQF5cCPZsAvm+pUTji0eenndkJTjI01ogEMqVoQ67N2XpJQfp
         Ew+XqkyV5NAO04tphhWH6dih6D89q30JSkblawSawRf0rjRAfGGBM35MqwHU61XQfP
         gI9ahlEXlk7lr3YEDBk+KY88CgsN2rfRxgQ36Zzxb9KdKjcLi3jtU6W5btlQMvdVdA
         4IyivKnZ6qUDpqgb2bg8Abj6bqK5Jp3m9qxDFPBns/B99cajzfyMgmGsIVa+A6JYaS
         Ick9c+o/Kt8jmGCJe7PLeBzwVXA4niGUlbkOHHdLQ9XsC2y8MnkdHkDaW4twUrUfxK
         p5QGLl9S7OEUQ==
Date:   Thu, 6 Jan 2022 14:19:59 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     ValdikSS <iam@valdikss.org.ru>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
In-Reply-To: <20211216224611.440397-1-iam@valdikss.org.ru>
Message-ID: <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 17 Dec 2021, ValdikSS wrote:

> This patchset adds support for Lenovo ThinkPad TrackPoint Keyboard II,
> in both USB and Bluetooth modes.
> 
> It brings additional functional keys mapping, native vertical and horizontal
> scrolling, trackpoint sensitivity configuration and Fn-Lock sync.
> 
> There is no code difference between the previous patchset, only minor
> patch subject changes and code/comments split.
> 
> ValdikSS (3):
>   HID: lenovo: Add support for ThinkPad TrackPoint Keyboard II
>   HID: lenovo: Sync Fn-lock state on button press for Compact and
>     TrackPoint II keyboards
>   HID: lenovo: Add note about different report numbers

Thanks for the patches. Could you however, please, resubmit with your real 
name, as outlined in Documentation/process/submitting-patches.rst ?

-- 
Jiri Kosina
SUSE Labs

