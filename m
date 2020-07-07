Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5152216A9C
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 12:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgGGKnl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 06:43:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbgGGKnl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 06:43:41 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78A882064C;
        Tue,  7 Jul 2020 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594118621;
        bh=k3okY/xRS+7U8IJIhmWll/qyOUGgOYnjBl3UxJUbRHk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Ugk3EVc7wqWIQdQV4nCdDdQqugE8kBHUzmdInW2ea4EOszgdoe177wa4VsKnC56iX
         jGTnn5YLAzbd3VKHyoMN1ftZjiRDhECkGuktVwih2V1PNOrebfM9EokBMuWuijkDN1
         tZg8RlUBFyDsIS8iQDLL4zduincDRg4doey/q+gM=
Date:   Tue, 7 Jul 2020 12:43:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/5] HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard
 support
In-Reply-To: <20200704132742.60197-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2007071242410.15962@cbobk.fhfr.pm>
References: <20200704132742.60197-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 4 Jul 2020, Hans de Goede wrote:

> This series really only is a small(ish) change. But I had to do some
> refactoring to be able to re-use the existing (mic)mute LED and fn_lock
> sysfs attribute code in hid-lenovo.c. That is done in the first 3 patches
> of the series. Even though there are 5 patches all 5 of them are small and
> hopefully easy to review.

Thanks, it indeed was pretty straightforward thanks to the split. Now in 
for-5.9/lenovo, including the followup fix for F23.

-- 
Jiri Kosina
SUSE Labs

