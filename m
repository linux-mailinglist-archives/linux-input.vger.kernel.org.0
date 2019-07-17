Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EEB6B767
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 09:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfGQHlk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 03:41:40 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40728 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbfGQHlj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 03:41:39 -0400
Received: by mail-lf1-f65.google.com with SMTP id b17so15695973lff.7;
        Wed, 17 Jul 2019 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5NOEQFD+zuKrLeCWvf7cleoyO1Swg908ZQFo5n4xHhk=;
        b=Gu3ceebuzGJdQmU0j53UXw57jRO2F5uuElW/35ZYXk8o4slX3gmMiu1RU/aixC1ktC
         zu0oxkF4YIAkqDAzM3ZQCwADq9ZLuiXp4wYZGHQQf5NKkewmTM+GiP3JA+1BBGxmoZPm
         Tl7kxrwSdsWP9R4B4pv3zUGXeoLbK8xrFC+BJGKMEvldyv3cSXjpjpJM3901NA4L9V/U
         TowNfJZr480T6sEjBL/MS38wiyQIlxIq5qm9t1sgKZsde4haox3dLrTFwHXOeUpau7IW
         TwvBkp1AsGV6qHrfzqALldzgraxC2/4QYMNuzyDh2H2fAsHjMBa63KJ3bbddy0XCRbZJ
         KYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5NOEQFD+zuKrLeCWvf7cleoyO1Swg908ZQFo5n4xHhk=;
        b=cx1RpYe3qQSmK2PCO4dXwSK7DJyhKCOMnZ8IftA0teCFr6FdoxJ5SM5DsDc+pe1hXz
         67vpJSdxV/puQ8yKOln6WGs+xJiJKaIHCEPOvd+ChRXBWRKkFht404pcySk1nCtqDqsL
         igIdA8LhB+aOgXOsadTkItasEnAaMWmo1XzMbqDW3lRNYBSUf7LWWqtmtkKmgmatlHes
         tsMdjHWkKm7XbjFUoCsJQLTR5abN6ZAvI4BvvOattRQKB+VKe8FiXDrX61rafAMJ4KIX
         s1yHZjsXD9signYMMPh+3pP2e50lmXwTDGnOoG4RW+PAktMnbARQ847BwLwImIm5YdlN
         96Jg==
X-Gm-Message-State: APjAAAXskB7YXi43sf1/Lj9DeZ8P+4YXdLjidYLkkS32pJUOhUOyFq3Q
        KOBuRdWmz3fQEimIli0EHW8=
X-Google-Smtp-Source: APXvYqz5Ypg/wmYvSsEG6+8icHrcMLjdy0eLm0AWKBPrawVbQL2wGlXyv7M8J/kRu3CX04gyosbhaw==
X-Received: by 2002:ac2:5636:: with SMTP id b22mr16725121lff.2.1563349297435;
        Wed, 17 Jul 2019 00:41:37 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id r68sm3288067lff.52.2019.07.17.00.41.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 00:41:36 -0700 (PDT)
Date:   Wed, 17 Jul 2019 06:33:46 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH] Input: atmel_mxt_ts - allow specification of config name
Message-ID: <20190717033346.GA621@penguin>
References: <20190712135338.6211-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712135338.6211-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lucas,

On Fri, Jul 12, 2019 at 03:53:38PM +0200, Lucas Stach wrote:
> From: Nick Dyer <nick@shmanahar.org>
> 
> Some systems require different touchscreen configurations depending on the
> populated touchscreen. To allow different configs to co-exist in the file
> system we need a way to tell the driver, which config should be loaded.
> 
> Signed-off-by: Nick Dyer <nick@shmanahar.org>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> lst:
> - switch to property name to not use underscore
> - Add more elaborate commit message

I believe we have already discussed this patch and back then I said that
the "atmel" prefix was not appropriate, as it describes not hardware
specifics but rather Linux kernel behavior and therefore we should be
using "linux,cfg-name" as the property. Unfortunately that version of
the patch got lost in my mailbox.

I will fish it out and apply.

Thanks.

-- 
Dmitry
