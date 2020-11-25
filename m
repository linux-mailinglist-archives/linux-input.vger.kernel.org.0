Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF5D2C4233
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 15:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgKYOde (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 09:33:34 -0500
Received: from v133-130-127-43.a05a.g.tyo1.static.cnode.io ([133.130.127.43]:41902
        "EHLO mail.hard-wi.red" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgKYOde (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 09:33:34 -0500
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.hard-wi.red (Postfix) with ESMTPA id EC3CE200016;
        Wed, 25 Nov 2020 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hard-wi.red; s=dkim;
        t=1606314807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hUMWTjwqHC5FWh3WEilIQ+lmDqLu8Utx5UHnZa/S/Z8=;
        b=LzGFY41BjU0AyqvcP02VnIghlvE9IWj4sYKvR4kvshWli3NzFUep9GGv2J+E3L7+Or/jsJ
        89nIEuHi1psd05QCIhb8VdUwaEORfiu8KpDuj8Jf7yuxv7dxkCOphoMgDjj2eNqvfcdS92
        KT1e/gH7vwwooAn6OMrom4qbKq5gB3c=
Subject: Re: [PATCH 1/2] HID: elecom: rewrite report based on model specific
 parameters
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201121205438.4092-1-lo48576@hard-wi.red>
 <nycvar.YFH.7.76.2011251428240.3441@cbobk.fhfr.pm>
From:   Takuma YOSHIOKA <lo48576@hard-wi.red>
Message-ID: <5d9b0f87-aa61-81af-5274-eaab8b73123f@hard-wi.red>
Date:   Wed, 25 Nov 2020 23:33:25 +0900
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2011251428240.3441@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=hard-wi.red;
        s=dkim; t=1606314807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hUMWTjwqHC5FWh3WEilIQ+lmDqLu8Utx5UHnZa/S/Z8=;
        b=gimtRH217GPutXETS40LClk+YYMYlY4IIRiBXmCzBwyE0V8QPf8jTK2WVf/HMgC1DWTDxH
        U3dKP+3xJ9LpWH719loVtHRW7896aennGreBwdmpK3Cl6sAdhkuYSPWaS9oHEdNQCSixp9
        lwftvQItmTs2FVZTUxcYupl1ANRvorM=
ARC-Seal: i=1; s=dkim; d=hard-wi.red; t=1606314807; a=rsa-sha256; cv=none;
        b=WkIV+SkaemXBAhFYUrQAVj4K8x4cnTIgq41pi1fG38CTOOdEDB77pP8HLD34ifkySxr/u/
        h3rTLmg5UTdyDSENNo45BHqxpgUF9NNijS++fM5wfgLvJOTV6HZzPrMEsqvS3Cyc5v720x
        LeRuZyZM4VGyHu1M5kqY6Alf19UHO1o=
ARC-Authentication-Results: i=1;
        mail.hard-wi.red;
        auth=pass smtp.auth=lo48576@hard-wi.red smtp.mailfrom=lo48576@hard-wi.red
Authentication-Results: mail.hard-wi.red;
        auth=pass smtp.auth=lo48576@hard-wi.red smtp.mailfrom=lo48576@hard-wi.red
X-Spamd-Bar: /
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2020/11/22 5:54, YOSHIOKA Takuma wrote:
>  	case USB_DEVICE_ID_ELECOM_M_DT1URBK:
>  	case USB_DEVICE_ID_ELECOM_M_DT1DRBK:
>  	case USB_DEVICE_ID_ELECOM_M_HT1URBK:
>  	case USB_DEVICE_ID_ELECOM_M_HT1DRBK:
> -		mouse_button_fixup(hdev, rdesc, *rsize, 8);
> +		/*mouse_button_fixup(hdev, rdesc, *rsize, 13, 15, 21, 31, 8);*/

I'm very very sorry, I noticed that I've forgotten to remove this commented-out line...
This "13, 15, 21, 31" line should be removed completely.
