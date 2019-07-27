Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E620B777D3
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2019 11:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbfG0JPr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Jul 2019 05:15:47 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35384 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfG0JPr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Jul 2019 05:15:47 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so38696216lfa.2;
        Sat, 27 Jul 2019 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+rUh3TcvJcuRsnzvwE5sXn7tIbCR4ba1afiJ99NGPaY=;
        b=oiP3UjYgO1P2U+PjmgZUjykl2BKytWCnatxa8AHUh6jF8MlShM+UXOVLh6OWmx1SFN
         oN3ZG0dvIzyNRMIjlrZHjD088wW1UVX5NTGypkoVqEskEKvdKhRwzIfNUUz0fI1UOFdT
         /Hg47LinJBMcI7I0VpOwV3usCOMN3XKANDbrLwNR7ky2KfGJbJronnHBwzHuJ4qsbNkt
         4e7LqpblcFmAezY1Kbac/y3NMZ2CKNe/mK/Wol79P3b2TprlK0KClo6GLB84ximdhx3z
         llog4PyY1cc+94nKGNYBM3UlsKtxRGoeXbCO/AhTrnYaXgJmmsV4spli0weWk0hwU9Yp
         Fpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+rUh3TcvJcuRsnzvwE5sXn7tIbCR4ba1afiJ99NGPaY=;
        b=HggB8hgAyF1GeENvMKam5sGS7GsUt868n3UnBPnzkrZ/6ysf/O4cSJqcJzbyVvWAMX
         ayPTSnueQklC/V4s0+BsE7NeBEenp1D6VOwzq9Cmew27RM968/2tV9qQ4CYvCMpV/qKz
         o5XQAxs4y7wrQkZ+m1dda4YLjnJLAhtIhC43FqaBaHyddKa/+oAvCnOD4bu4djZ2eRVq
         G/sujRAj7oOfauLm3fvY3yX4gKVRW9SMCWnb3L8g3MQqfp0JKl96hwHRv2EanYwUc7Vo
         DfmuHrbnkqGfr1+5j8nDok1LysuaARZpMSXlJrI0jzfYjd7F51Tfg0VkmYTV/uq7jMUv
         FlJA==
X-Gm-Message-State: APjAAAXSopwDoIu5o+PK4UFwn/wvEtreUUEQ7gaAwUyECPi4h6ZZ3bt6
        LGjLUwOvo8yWQHKVJZe1YSg=
X-Google-Smtp-Source: APXvYqxO2L8VoYDuvDuoMWh5O4GmsOA7NxLj/ZFVzL9neLCIvQFirqVxNYKNF2tzz20l4iRS5F85EQ==
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr23502535lfm.36.1564218944436;
        Sat, 27 Jul 2019 02:15:44 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id d16sm10853347ljc.96.2019.07.27.02.15.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jul 2019 02:15:43 -0700 (PDT)
Date:   Sat, 27 Jul 2019 12:15:41 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v3 1/2] platform/x86: surfacepro3_button: Fix device check
Message-ID: <20190727091541.GD795@penguin>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-2-luzmaximilian@gmail.com>
 <CAHp75Ve+3c-TFeN3Dh-DB75Rjft8mY2DA8vNkrFyp7JK-ZOjDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve+3c-TFeN3Dh-DB75Rjft8mY2DA8vNkrFyp7JK-ZOjDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 25, 2019 at 08:57:53PM +0300, Andy Shevchenko wrote:
> On Sat, Jul 20, 2019 at 6:05 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> >
> > Do not use the surfacepro3_button driver on newer Microsoft Surface
> > models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
> > and possibly future generations) use the same device as the Surface Pro
> > 4 to represent their volume and power buttons (MSHW0040), but their
> > actual implementation is significantly different. This patch ensures
> > that the surfacepro3_button driver is only used on the Pro 3 and 4
> > models, allowing a different driver to bind on other models.
> >
> 
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> assuming it will go thru Input subsystem.

I can take it, but I do not think it is dependent on the other change
and thus can go through platform tree as well.

Thanks.

-- 
Dmitry
