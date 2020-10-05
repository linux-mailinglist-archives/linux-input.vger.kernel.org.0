Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BB5283D17
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 19:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgJERNb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Oct 2020 13:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgJERNb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Oct 2020 13:13:31 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BB3C0613CE
        for <linux-input@vger.kernel.org>; Mon,  5 Oct 2020 10:13:31 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so7361999pff.6
        for <linux-input@vger.kernel.org>; Mon, 05 Oct 2020 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7bhCeiTUjnphUWRDSI1SRBlkridYAeaHOaH45yhXa8A=;
        b=P/b0Ob/fFcy/heSo+q95J5DaeQDSbQN1ccmasOMMvQkaabDLONlnS2mqLXCr3rRJb0
         VEXdqJgPfNhVKkakHggyeq9rIpxIUKET7O8kK9fPoiqahVimXxAmNgmlGwv3nYG9f/eQ
         4MNlDqlZBoaFH9lOrAobzpzvPNTCJevKzdmyQJM7m6rT4+TlymNxXPIHlLxWxwHiQpKb
         JXG2WZBQyMF8leu7qhdIy1InD4Bzb9vhSYOImbye6qDFFuW5O2QrP+VjEsjp2rt19Ipy
         WvaZJOtKEBmR/mnaCB/XfFQhdhhPyjzUn6B7PZJ0xS9SFyAf0Otd+CG2srN2S4zuyptm
         vtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7bhCeiTUjnphUWRDSI1SRBlkridYAeaHOaH45yhXa8A=;
        b=gGkd2QFMl0M028mQBUE4RQIRy5hL4tZ+hGCD4sZhJrl0lc1Fn0paKyjkFt/il6zHyH
         F5DF2SZ6J2+eNQWPMJvRXekkzsVNmUiT9LSg+ktuxvm5mSAzZJtAZrmrNv9z1Q1Q6R3E
         0WdWCKtT17t/Jdje2kgFLxhM1x02DO/EroOE4kiwnmzWYWwIAqhArg6g9flHdCvwH9aB
         +Vd+AeIXIGfsswkIJ/IWXjLYmXnNagsKlQSHCv8+GEg69F6lFN7/w9By6iFPKXA74P5C
         HiBnhSoitSHqqYJk6YEv3e6DN3Yw92VF46/PB3zRm/t2h+jVJMjc/kCvKvVkedEV/hEU
         LGjg==
X-Gm-Message-State: AOAM533FXB5P7OvB2LXVPAZR7p/YQEhhpw6fOaT617W/EjzqIqeU89Q4
        yE+IDiVdxK1aRIRtLgdFNBCKafcJplE=
X-Google-Smtp-Source: ABdhPJyfk57LLqM+UrEG6vcjyiL9Q/bOvkhuOAlHok5hSugoAdeItJ0yKDW3tvPOkzQWkK9IG8pCnw==
X-Received: by 2002:aa7:88c8:0:b029:142:2501:39ef with SMTP id k8-20020aa788c80000b0290142250139efmr532140pff.62.1601918010575;
        Mon, 05 Oct 2020 10:13:30 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n128sm194892pga.37.2020.10.05.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 10:13:29 -0700 (PDT)
Date:   Mon, 5 Oct 2020 10:13:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Lyude Paul <lyude@redhat.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - enable InterTouch for ThinkPad T14
 Gen 1
Message-ID: <20201005171327.GJ1009802@dtor-ws>
References: <20201005114919.371592-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005114919.371592-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 05, 2020 at 01:49:19PM +0200, Hans de Goede wrote:
> With the new RMI4 F3A support, we're now able to enable full RMI4
> support for this model.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
