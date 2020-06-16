Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED5F1FB5CC
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 17:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgFPPPB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 11:15:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:35242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728993AbgFPPPB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 11:15:01 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1AF9207C3;
        Tue, 16 Jun 2020 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592320501;
        bh=yrnL9UpX/a11nNq4rn8b+jxH1C651aqSlV/dcI4pLBY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XrEjTEvUsw82hLvg+MOfNxODiSCJoS4iInjheBywZPBY3ZL7B0eyzWvm6snliU9ra
         XWi5JbXfqTzHMnJpREBvuThJBHcBdNbroQuRCoTN3I46kRlDWzg/Gj4dfszbYFv92b
         s9OAbqRr1jSV1W9wP2XvK2V75k/952SdyMdG5KPE=
Date:   Tue, 16 Jun 2020 17:14:57 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: usbhid: do not sleep when opening device
In-Reply-To: <20200610043824.GA171503@dtor-ws>
Message-ID: <nycvar.YFH.7.76.2006161714270.13242@cbobk.fhfr.pm>
References: <20200610043824.GA171503@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 9 Jun 2020, Dmitry Torokhov wrote:

> usbhid tries to give the device 50 milliseconds to drain its queues when
> opening the device, but dies it naively by simply sleeping in open handler,

I've changed 'dies' to 'does' :) and applied, thanks Dmitry.

-- 
Jiri Kosina
SUSE Labs

