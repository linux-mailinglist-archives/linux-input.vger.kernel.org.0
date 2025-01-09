Return-Path: <linux-input+bounces-9105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AADA0714B
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 236D81674AB
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9F3216380;
	Thu,  9 Jan 2025 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmQCdugi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB21421576E
	for <linux-input@vger.kernel.org>; Thu,  9 Jan 2025 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414283; cv=none; b=K12McBauKgbEXtpwit0eTyR+PrdP+7Hb8dlB1/0BG+jyTiLhagyDDmvYL0aHPrm3ZjOlmAFp61eCC2IBVkhGZugISDqYs1Egz5u5loYcxhTAKNNO7tE7V6Kfh1hBi3bHikafWytm5LyDlDDKATQHxi2d1tlUJEFp7N4We+Bd1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414283; c=relaxed/simple;
	bh=aiXMBe8rBIiNY/84C39nQ9qE7E0dW9Po5NrH1QaZOC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k/PBxSmhIl2NEWr9gKZY+dm4xbs4Ue6aPmCThEF4JjMgvPDS11xOns8gDpVkX1Rav7bXIbQk2W6Wu/DnW2rpKKffG1jYo7nPzKhtU9JuSXe6P2tC48PJWqoFQQvn2ZQEK2qp4jJFTVOKVVqdK6dhRuWKk7KWefjCpezTbY2Wi5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmQCdugi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1EFC4CED2;
	Thu,  9 Jan 2025 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414283;
	bh=aiXMBe8rBIiNY/84C39nQ9qE7E0dW9Po5NrH1QaZOC8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jmQCdugiUNblu0OpbllMqVxTdR9Rd4iuxA642eq7U2b9ntpQWyDVNvJ3+grLntDKB
	 ElwbAIHpb0Gdsu+QvpUq/6kPmq1xO1FjXYTrb7Da438v7A+K+BO5Y3Omivm5hc2UpC
	 9dWGG3wtg6hmFw0nkqzulAcvyfRRjv9jzj783n+alguSiei/n/QsCms7cqsyvBzUDC
	 0BuiJR7IHv21w1QbP5xSU4Lms9yDUb2fxS5GbUAG50XzKXWzQiu+3sLCMW6NjHivE5
	 6ixypVag+trRXOBuyOS2bRIj25SG9uwdX5LoZZuE/7TJQ+RvXZ5Auph8ZoeDI3NPg3
	 JVYUePL4AFxrg==
Date: Thu, 9 Jan 2025 10:18:00 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-steam: Make sure rumble work is canceled on
 removal
In-Reply-To: <20241226023424.653914-1-vi@endrift.com>
Message-ID: <5p413q2s-p18q-2241-4sr6-468o9o7s035n@xreary.bet>
References: <20241226023424.653914-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Dec 2024, Vicki Pfau wrote:

> When a force feedback command is sent from userspace, work is scheduled to pass
> this data to the controller without blocking userspace itself. However, in
> theory, this work might not be properly canceled if the controller is removed
> at the exact right time. This patch ensures the work is properly canceled when
> the device is removed.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-steam.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index 6439913372a8..af38fc8eb34f 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -1306,6 +1306,7 @@ static void steam_remove(struct hid_device *hdev)
>  
>  	cancel_delayed_work_sync(&steam->mode_switch);
>  	cancel_work_sync(&steam->work_connect);
> +	cancel_work_sync(&steam->rumble_work);
>  	hid_destroy_device(steam->client_hdev);
>  	steam->client_hdev = NULL;
>  	steam->client_opened = 0;

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


