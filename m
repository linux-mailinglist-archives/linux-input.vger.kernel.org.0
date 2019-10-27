Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 260DFE69D9
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2019 23:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbfJ0WJD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Oct 2019 18:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:59286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727096AbfJ0WJD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Oct 2019 18:09:03 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93B872064A;
        Sun, 27 Oct 2019 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572214142;
        bh=1afUvgUbZd6YXIDS42ZiyjDym80dlj8n0cypKBDn8ck=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Nl+5okzwBc3jMpuSQma9BkDguBDuN+5zWSoVmb3/M4YOH29yrM7Hm0YBiET3fP5yN
         /o1dcMFQjAzL9FEo6Qy3XCxWhe6AQPjcRUEfkfq+b8TUODpzOeuPbBvjT8/uiX+9pf
         UyRLOjCrYIlEOrOHAaDj1xkzRKXKaC/1MSJiQmEk=
Date:   Sun, 27 Oct 2019 23:08:58 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>
Subject: Re: [PATCH v3 2/2] HID: google: Add of_match table to Whiskers switch
 device.
In-Reply-To: <20191023024410.226524-1-ikjn@chromium.org>
Message-ID: <nycvar.YFH.7.76.1910272308010.13160@cbobk.fhfr.pm>
References: <20191023024410.226524-1-ikjn@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 23 Oct 2019, Ikjoon Jang wrote:

> Add a device tree match table.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

As the dt-specific part is probably going to be more substantial here, 
feel free to add

	Acked-by: Jiri Kosina <jkosina@suse.cz>

and merge through dt tree; in case you'd like me to take it through 
hid.git, please let me know.

Thanks,

-- 
Jiri Kosina
SUSE Labs

