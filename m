Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088833D4093
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 21:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhGWSam (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 14:30:42 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44983 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhGWSam (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 14:30:42 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 39DFE40002;
        Fri, 23 Jul 2021 19:11:11 +0000 (UTC)
Message-ID: <c09e3c193c62a0a85c552ebce85f858883996104.camel@hadess.net>
Subject: Re: [PATCH v3] HID: logitech-hidpp: battery: provide CAPACITY
 property for newer devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Hamza Mahfooz <someguy@effective-light.com>,
        linux-kernel@vger.kernel.org
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Fri, 23 Jul 2021 21:11:11 +0200
In-Reply-To: <20210723185720.29314-1-someguy@effective-light.com>
References: <20210723185720.29314-1-someguy@effective-light.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-07-23 at 14:57 -0400, Hamza Mahfooz wrote:
> For devices that only support the BATTERY_VOLTAGE (0x1001) feature,
> UPower
> requires the additional information provided by this patch, to set
> them up.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> 
> v2: use ARRAY_SIZE() and set voltages[]'s size to 100
> 
> v3: add a check to ensure that exactly 100 elements are in voltages[]
> ---

> <snip>
> +       BUILD_BUG_ON(ARRAY_SIZE(voltages) != 100);

Sweet!

Reviewed-By: Bastien Nocera <hadess@hadess.net>

