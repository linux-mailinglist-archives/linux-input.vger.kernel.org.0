Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F99DB56C
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 20:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732851AbfJQSD2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 14:03:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34268 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730483AbfJQSD2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 14:03:28 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so2155505pfa.1;
        Thu, 17 Oct 2019 11:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sB2aUDJLuFeOLSWpmQCdl6ISD4YnW5irtx4fCSZlFFU=;
        b=LtEzZSByCFb0s1oUS8I3zGFbUZg0fr4lFmNlgHAzVxXXqrGhXn6YkTnwppjKEUd9vd
         /6h0JsBrHDqWEf7qeFNInKDzbwOWSUuKmcMchahnfuSRkwntCqxFbHpmjiPSO2pCt32s
         zbkEdqtXKGt9LzZZqRWD5Rv0Mqrawopex0ftXChnEV87au/6a0oQ07+XTyijSDXWguQD
         kw5K8cQ8o/zjDPCuTlzwuG5bcKcFL+OJVPafuDbAxnBi3jB+jPtZDYeYBd7jiWIGXzHX
         QwtQTt91xF5lliKn5iJRyzVRp175uN9jM0v8ZpKaiuvXWd5BNiwqfTwmoc9Uo5aW1Iyq
         jYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sB2aUDJLuFeOLSWpmQCdl6ISD4YnW5irtx4fCSZlFFU=;
        b=D6jvnnL6WZiARusb5XwzqitoNCSD6hhZWO+gfhT/Z/NYKjUU/bkh4QQBkQ9HGF45+/
         /lfegBYVm4d+KW3cwSHYMdFifX/mwRFg73eLJAL78PE9EkHmFsMM96M0ZHnJhAiAetZy
         ZNA4OuyMK6UmiJFpP/+sQgU2Iy012umytiUFYB45wgaCT17gGl8YbUU5i6Yj7qN6dvfV
         AVGvIY/PSQFacxEq7qFDXv/XBTZ5wF64M063Cyj5NOJRKMY0P7mZj4wosrqV3up8Mc8G
         j+yPp6JxU+C5rNKUrNIiat6g0PSgGdi3JkC8TLmIyP/3HFDBMILwsi3WkakbkslmtqMa
         naSg==
X-Gm-Message-State: APjAAAVQtTEjRCTujPPcmy0UKspmJej67byZ1Ij2I+kPrl/PNTtBMqQm
        OUT0nuq0w5nLEU/SAXUgDWU=
X-Google-Smtp-Source: APXvYqyd7IPL6DMWZBFYBl58qOoK1v+NPvmlpAxCka4WadnK6QqcStAmgdh5DM+NIHq/X4IgewnWqw==
X-Received: by 2002:a17:90a:b78c:: with SMTP id m12mr5970486pjr.12.1571335407183;
        Thu, 17 Oct 2019 11:03:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q204sm3614927pfc.11.2019.10.17.11.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 11:03:26 -0700 (PDT)
Date:   Thu, 17 Oct 2019 11:03:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] input: edt-ft5x06 - add polled input support
Message-ID: <20191017180323.GJ35946@dtor-ws>
References: <20190430185859.24015-1-nsaenzjulienne@suse.de>
 <f029cb51eb99b9a51743b87cb736ec66e8ec0ae5.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f029cb51eb99b9a51743b87cb736ec66e8ec0ae5.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nicolas,

On Wed, Jun 12, 2019 at 01:57:46PM +0200, Nicolas Saenz Julienne wrote:
> On Tue, 2019-04-30 at 20:58 +0200, Nicolas Saenz Julienne wrote:
> > Some hardware configurations might pass on providing an interrupt line.
> > In that case there is always the option to use a polled input approach.
> > This patch adapts the driver for it.
> > 
> > The polled approach is only triggered if no interrupt is provided by the
> > firmware or platform data.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> 
> Ping :)

I reworked the polling in input devices so we no longer need to create a
separate input_polled_dev instances and instead have regular input
device work in polled mode by calling

	error = input_setup_polling(input_dev, poll_fn);
	...

Please adjust your patch and resubmit.

Thanks.

-- 
Dmitry
