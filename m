Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10ABC373B60
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbhEEMgM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:36:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233471AbhEEMgH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:36:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C12F613AA;
        Wed,  5 May 2021 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620218110;
        bh=WoLNm9lJaRrgB/82wCLAmBaJ86xs4xLka0E/fHFUwDk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KXOeDFq6Mjqix5IiRmXDa0u52xHRdzYyNmHEH22Vm6ZGKN3Vzu6uapC66DDx3Nkc0
         7jNFLP2aYUyNZsRMXqgzUjfg+yapORQGnENQAh5bYac5S++8fuiRwFNIZMbXTuMQkU
         WYOSlvSWKbpkxKk3FPr7mKyE4IIBYt2JWqt+Br99lT1ti8c3GLOwIzXSKTO/+BksKi
         GWoTsnQ4bnPc7mxBihBS8Ynmkb5KVTpiDVYHxsRhmnvvovlAiskAx4V6lBNx/yF8YV
         KHJx31ren6a82ghxz9hdocjHoF5yy6O12qVKDRJbbevqqmjPb12rXq7BMdm2qJJ+SJ
         8UpiNMjGvOOgg==
Date:   Wed, 5 May 2021 14:35:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] HID: google: Add of_match table to Whiskers switch
 device.
In-Reply-To: <20210415032958.740233-3-ikjn@chromium.org>
Message-ID: <nycvar.YFH.7.76.2105051434520.28378@cbobk.fhfr.pm>
References: <20210415032958.740233-1-ikjn@chromium.org> <20210415032958.740233-3-ikjn@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 15 Apr 2021, Ikjoon Jang wrote:

> Add a device tree match table for "cros-cbas" switch device.

Applied, sorry for the delay.

-- 
Jiri Kosina
SUSE Labs

