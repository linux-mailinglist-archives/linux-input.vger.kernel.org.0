Return-Path: <linux-input+bounces-12775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CA0AD42CA
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E7FA7A2418
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770CF2620F1;
	Tue, 10 Jun 2025 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mx/jK9N6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F14829D19;
	Tue, 10 Jun 2025 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583295; cv=none; b=MtBSixx/MIPk2B1w0PKXOwnUhuhQswUE+WLfbeInHBSy5uRK+QUrF6X6aleDEgbKmHkhLFWC0N6QvCJTTeRGwsMkHlm80AeUJl499DLSitC7bpU7UUPksvuhOvQiGcPGsk+wm5ArD+pV0XMkXd1ochaws+iCMkQsy665CIpczZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583295; c=relaxed/simple;
	bh=NDRljzAmxnkAkk86sHYardm9OxEC3qtmaQ6rc23r1OQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=smGLVSjIrxdPQOPMJYFxdHr2XJ89i8Cwjxox7MPXwLAy+eTaDuhNwSrnukCuCdDgrfM4Hi2NS9G3MRr8bXZTQ/up6uWr0VFtZkKMW3q7BAcp7iQWHDtEbw4GTErYU92OW2iMPt+AixNStUY/Zlyr8QabZuVJ14oDjWbkwv8FVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mx/jK9N6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13F4C4CEED;
	Tue, 10 Jun 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583295;
	bh=NDRljzAmxnkAkk86sHYardm9OxEC3qtmaQ6rc23r1OQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mx/jK9N6GUbc6xkLkcou4FW9UTxiEBFhz3KFGrCcrvHERYpoTh/QbWPjvygZqGOCT
	 wkiRsMLlL6BRKpDE+btUCmgJalccmznvrBUlt6S8AeOKa0pD87VdlB4LP2DJ4S1Hfg
	 WLU3Gc8OPTcJsToWWgmp7O/ws8fBUIRt9BB3WqlIy+ypU79FKwLVN6o97Hk4aJAL4s
	 rWCZAUczC+9ORteOMMnLogMPWgb73S6qsZtcOvnVyHKL37cg3c9sF6rw1+OJ+9tsdl
	 nFRKY2jEp2pq/V5OohXH3Aja0bZZ+dqzcX9OT0V7XbL3ycRZkx0Ic7tPSlP28GZYIk
	 Wxb+iGdAPUSmg==
Date: Tue, 10 Jun 2025 21:21:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>
cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Josh Dickens <joshua.dickens@wacom.com>, 
    Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, 
    Aaron Skomra <aaron.skomra@wacom.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: fix crash in wacom_aes_battery_handler()
In-Reply-To: <aCrx1iRQ-9tXiyJp@x1.ze-it.at>
Message-ID: <p4917005-n9n1-0577-q49n-o9639pos5o44@xreary.bet>
References: <aCrx1iRQ-9tXiyJp@x1.ze-it.at>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Thomas Zeitlhofer wrote:

> Commit fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extended
> inactivity") introduced wacom_aes_battery_handler() which is scheduled
> as a delayed work (aes_battery_work).
> 
> In wacom_remove(), aes_battery_work is not canceled. Consequently, if
> the device is removed while aes_battery_work is still pending, then hard
> crashes or "Oops: general protection fault..." are experienced when
> wacom_aes_battery_handler() is finally called. E.g., this happens with
> built-in USB devices after resume from hibernate when aes_battery_work
> was still pending at the time of hibernation.
> 
> So, take care to cancel aes_battery_work in wacom_remove().
> 
> Fixes: fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extended inactivity")
> Signed-off-by: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>

This looks good to me, and I am planning to push it to Linus through 
for-6.16/upstream-fixes.

Jason, Ping, any chance you could give your Ack to this one before I do 
so, please?

Thanks.

> ---
>  drivers/hid/wacom_sys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index eaf099b2efdb..e74c1a4c5b61 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -2901,6 +2901,7 @@ static void wacom_remove(struct hid_device *hdev)
>  	hid_hw_stop(hdev);
>  
>  	cancel_delayed_work_sync(&wacom->init_work);
> +	cancel_delayed_work_sync(&wacom->aes_battery_work);
>  	cancel_work_sync(&wacom->wireless_work);
>  	cancel_work_sync(&wacom->battery_work);
>  	cancel_work_sync(&wacom->remote_work);
> -- 
> 2.39.5
> 

-- 
Jiri Kosina
SUSE Labs


