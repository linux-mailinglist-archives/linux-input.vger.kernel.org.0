Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A95252C49
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 13:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgHZLOa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 07:14:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:57426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbgHZLO2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 07:14:28 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 623B02080C;
        Wed, 26 Aug 2020 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598440468;
        bh=dW+XxAJpHFDjfaJ4wYtnP+dey0mXAR+H3ngD3LKAmuo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=1yIPNP/7AHbxNWQ1HaDcLefPIcVjeGNsUFaos+hIWvoiz/esGedsdqPCJ1GMyr/aP
         XarLaoP5WJvhx+Qc+M2zykBddRvkv5BzJsBiQD8q7Q8t+vVIW07emqzXwvt1dH+BBI
         nNWHLi+dLOKjh1FiKx4FMaJxNNM6wMQAbpsffeW4=
Date:   Wed, 26 Aug 2020 13:14:25 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sean O'Brien <seobrien@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Wei-Ning Huang <wnhuang@google.com>
Subject: Re: [PATCH v2] HID: google: add google vivaldi HID driver
In-Reply-To: <20200825085044.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
Message-ID: <nycvar.YFH.7.76.2008261311550.27422@cbobk.fhfr.pm>
References: <20200825085044.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 25 Aug 2020, Sean O'Brien wrote:

> Add Google vivaldi HID driver. This driver allows us to read and report
> the top row layout of keyboards which provide a vendor-defined HID
> usage.

Thanks for the driver.

I actually believe we should follow the standard convention here, and have 
just one hid-<vendor> driver for all google products. Currently we have 
hid-google-hammer, and this would add hid-google-vivaldi. Would you (or 
Wei-Ning, CCing here) object on merging these two together?

It's of course possible to still have hid-google-vivaldi.c and 
hid-google-hammer.c, but then have only one CONFIG_HID_GOOGLE option 
that'd link these two (and pontentially any future ones) into one single 
hid-google.ko.

Thanks,

-- 
Jiri Kosina
SUSE Labs

