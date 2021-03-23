Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B543461BB
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 15:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhCWOpo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 10:45:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:57010 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232177AbhCWOpf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 10:45:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 744B5AD6D;
        Tue, 23 Mar 2021 14:45:33 +0000 (UTC)
Message-ID: <0241750f5e12fd2805c98ba376e38f1355c31e35.camel@suse.de>
Subject: Re: [PATCH] Input: i8042 - fix Pegatron C15B ID entry
From:   Marcos Paulo de Souza <mpdesouza@suse.de>
To:     Arnd Bergmann <arnd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marcos Paulo de Souza <mpdesouza@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Po-Hsu Lin <po-hsu.lin@canonical.com>,
        Kevin Locke <kevin@kevinlocke.name>,
        Hans de Goede <hdegoede@redhat.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        David Pedersen <limero1337@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        Chris Chiu <chiu@endlessos.org>, Jiri Kosina <jkosina@suse.cz>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 23 Mar 2021 11:42:23 -0300
In-Reply-To: <20210323130623.2302402-1-arnd@kernel.org>
References: <20210323130623.2302402-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2021-03-23 at 14:06 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Zenbook Flip entry that was added overwrites a previous one
> because of a typo:
> 
> In file included from drivers/input/serio/i8042.h:23,
>                  from drivers/input/serio/i8042.c:131:
> drivers/input/serio/i8042-x86ia64io.h:591:28: error: initialized
> field overwritten [-Werror=override-init]
>   591 |                 .matches = {
>       |                            ^
> drivers/input/serio/i8042-x86ia64io.h:591:28: note: (near
> initialization for 'i8042_dmi_noselftest_table[0].matches')
> 
> Add the missing separator between the two.

Oops, my bad...

Thanks for fixing it Arnd.

Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>

> 
> Fixes: b5d6e7ab7fe7 ("Input: i8042 - add ASUS Zenbook Flip to
> noselftest list")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/serio/i8042-x86ia64io.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h
> b/drivers/input/serio/i8042-x86ia64io.h
> index 9119e12a5778..a5a003553646 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -588,6 +588,7 @@ static const struct dmi_system_id
> i8042_dmi_noselftest_table[] = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER
> INC."),
>  			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook
> */
>  		},
> +	}, {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER
> INC."),
>  			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /*
> Convertible Notebook */

