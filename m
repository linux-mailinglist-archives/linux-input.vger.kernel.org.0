Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164EF282EF0
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 04:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgJECqC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Oct 2020 22:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgJECqB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Oct 2020 22:46:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44351C0613CE;
        Sun,  4 Oct 2020 19:46:00 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y14so2567836pfp.13;
        Sun, 04 Oct 2020 19:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=45rSB5Z8oeWjII+fTO3+QvTrq+fKqwrfIH6YR1Gnk4I=;
        b=qrOXDOJjnr+IXlBqE9LMdTnkTlrTteqMLpsvCMUJRZHl0ukAAH0NGjS7RlVFMJCpB2
         n5QKRDyCAxXuGV+vHv2aNigC+o7d5gEc6Sp2SASORz/UfB5kHA4v8811asOYmXPTR3Se
         2dcy0Q5nDuKG8hz/PO7k0MHDYvQ8wt4/FeNTLmneDriWONUbEnV4jjMITI+iY9n4+HKZ
         aIr3sAB1N+uZ1Krq5Wgvk3MCADpXAuBANedRCEw7LLDEwHhPbufMPiKWH57IPoGDKwKs
         WMga0SVyx9/nJFr3+Pf2GZi1g6Dol/LqqD5n5ok+IKXIn2TXstQejLQbE1ncY1r1ady8
         WHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=45rSB5Z8oeWjII+fTO3+QvTrq+fKqwrfIH6YR1Gnk4I=;
        b=AXQVu6YI8beKuH9eQVq29HCHIAfOBaYrvM3lekKffN8xD1ESeWsuJhTaPsVNu4vQeZ
         d7eB7tqQZzCc50w5Zbh3w4qMsD0l8SfuBnN2OfsSsg6OBvLHDgyfONcArLGmb0prDkmE
         91PAFVVa+GJcRU0bcrb5hcIbjI7VfF1eB+2ubS+HQhK4gUfMYLsIokn/9NdlWZfEvnet
         YvNS/IB/Yuhp30ifpp1O8Xta5fkLxK3LzA++IWW/9A1x+u6akhUySpTH6Fyonw/5Kjun
         ElbXK8YxcjO2W8bFdjxNxoOyPgV49Bak3kSOKhfqaoGa/SpczUIdRq4TGarBf8d8WWqx
         82Kg==
X-Gm-Message-State: AOAM530c/ykJIQnHq4nZhXt9ibbmQvJbabV0bxjg4Gf2gUG9kpMiNheN
        bu8/Du/QpehyJBXaKzfl944=
X-Google-Smtp-Source: ABdhPJxi801oUAWVGLACEvWpBY1Aof0e+xmL50LPEB6BiKoB45KDL5fLtcuRT7X5XfJpO/UXLXQyTA==
X-Received: by 2002:a62:7d91:0:b029:13e:d13d:a061 with SMTP id y139-20020a627d910000b029013ed13da061mr10255223pfc.39.1601865959780;
        Sun, 04 Oct 2020 19:45:59 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id k6sm10073973pfh.92.2020.10.04.19.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 19:45:59 -0700 (PDT)
Date:   Sun, 4 Oct 2020 19:45:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: Re: [PATCH v3 2/2] Input: synaptics-rmi4 - add support for F3A
Message-ID: <20201005024557.GC1009802@dtor-ws>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
 <20200930094147.635556-3-vincent.huang@tw.synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930094147.635556-3-vincent.huang@tw.synaptics.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 30, 2020 at 05:41:47PM +0800, Vincent Huang wrote:
> RMI4 F3A supports the touchpad GPIO function, it's designed to
> support more GPIOs and used on newer touchpads. This patch adds
> support of the touchpad buttons.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
