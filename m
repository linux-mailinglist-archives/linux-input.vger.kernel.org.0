Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09780318383
	for <lists+linux-input@lfdr.de>; Thu, 11 Feb 2021 03:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhBKCU6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 21:20:58 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:13061 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhBKCU6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 21:20:58 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4DbgMJ6Nxfz80;
        Thu, 11 Feb 2021 03:20:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1613010015; bh=GmHC768vuaP1liy5q0cWcD0y5WVzLpTLzp28MwacV28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jr48N7n8S8tiRQCxkrkc6wIAHhlUY4bp3QnkxuhuX6qBr6lnsE0Cx+oOAyXcZdwzf
         tN/H10cVkgI3P6d3eST88tbroNogxN84qSQAkUcnr0kehvJVvx/jSHgq3z+RqKPpHi
         aCF7H6wPzRsdpYh7ExeI1PBDvL5HQkPzjoGvYBP5hIPSrbZ28NcrTBrQPXOPn/izO6
         C8KOctyjyYg9HlPKILqWK6TTSFVx8Cbsz6eqy8WwBblja74qOxuAT9pxpGZgXikMRq
         F8iT/zQH//eWkryzZyU/sthk6xAcgLecquNP4hWiVtmTCU7CLBdod/NAHFEjHITXS7
         nm0eg4r8c+Feg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 11 Feb 2021 03:19:44 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        linux-input@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH RFC] input/elants_i2c: Detect enum overflow
Message-ID: <20210211021944.GA4933@qmqm.qmqm.pl>
References: <59e2e82d1e40df11ab38874c03556a31c6b2f484.1612974132.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59e2e82d1e40df11ab38874c03556a31c6b2f484.1612974132.git.jpoimboe@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 10, 2021 at 10:25:28AM -0600, Josh Poimboeuf wrote:
> If an enum value were to get added without updating this switch
> statement, the unreachable() annotation would trigger undefined
> behavior, causing execution to fall through the end of the function,
> into the next one.
> 
> Make the error handling more robust for an unexpected enum value, by
> doing BUG() instead of unreachable().
> 
> Fixes the following objtool warning:
> 
>   drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>

Reviewed-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

> ---
>  drivers/input/touchscreen/elants_i2c.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 6f57ec579f00..4c2b579f6c8b 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -656,8 +656,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  			error = elants_i2c_query_ts_info_ektf(ts);
>  		break;
>  	default:
> -		unreachable();
> -		break;
> +		BUG();
>  	}
>  
>  	if (error)
> -- 
> 2.29.2
> 
