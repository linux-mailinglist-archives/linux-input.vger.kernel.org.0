Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54CA228FDA
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 07:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGVFlt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 01:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgGVFlt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 01:41:49 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A92C061794;
        Tue, 21 Jul 2020 22:41:48 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so579663pjw.2;
        Tue, 21 Jul 2020 22:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JOXcjH3Ds2znsGQsPtT2U0WmJsXIq3lc+gYn1wfYnuU=;
        b=dEUQNOgGUrX8oVxReZCZ/tx5vnWEETp9edbUaud/VSlLiopK4JeDzocnvain0FsLMw
         7PICdvOjUghPVTCW0qjN7n6SnZ2H5nN1HMvs9uDK+IXA85ET0oBW15K8tQX8j6o617pN
         q+l75VjFGRhh/avhzCvbSqMXcuvtlbi3DMXeui18+MwYxPLsjtIX2AZUZJiOAE/9flCV
         ea2Fhc2rKiCCf9XkPrhipvLf0Mgp4dryjrLrNufZYZ0rIbtgYRwukhkD6F9yssQLC+fk
         WRh6Y5nrhcl9JFV3K3uPb9dVFzvSPLWAr6x/D7HTFWahFrwb9QZUZWXQW/5qLx4TRohI
         fmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JOXcjH3Ds2znsGQsPtT2U0WmJsXIq3lc+gYn1wfYnuU=;
        b=uH0Yaikdy5yTVcvHRWVq4LPlk17Z/mc+iAZo4a9tkefIyHCi6qS3v86+0hSWv4kTqE
         Wh4OFI8Ly4S4pj9xSRUPBUC7kLXRlgA3NB/PW+pKUHqL4vaNhw4duf8H3PRHky+A+8Io
         NkgOlWJ85LoL8tZFiOCAPy5Km+G7qiLSSXwasjdcqyl4r/jUD3FP26SSpTgoohClTPXK
         RWd0nXlw68oE3Flz7AciFyK4aaBdiYN8wIaEVue+L+gu5lu28AZTo+boyuIcbvdQJRbG
         HTYEs8Xtp9HWZVVzu7swCspr6FO0yxjoM4Xel7Ti88ooEkLmp5lmmp6tg9/8OJBXp9fH
         7BuQ==
X-Gm-Message-State: AOAM531PQunOIab32ET/EYs2RtrCn0RZICuofunhWuASlJYauchVCe5P
        kLJrKAFF17zoz7CfzuROGHY=
X-Google-Smtp-Source: ABdhPJwyZCXr57OI4rRNX0FltpSSmzGxpQFnQXUcYXlI0UFD0tljQn5BhDndhCziMb1aAG5xOB3eAQ==
X-Received: by 2002:a17:902:684e:: with SMTP id f14mr26597687pln.166.1595396508374;
        Tue, 21 Jul 2020 22:41:48 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d16sm22280079pfo.156.2020.07.21.22.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 22:41:47 -0700 (PDT)
Date:   Tue, 21 Jul 2020 22:41:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
Message-ID: <20200722054144.GQ1665100@dtor-ws>
References: <20200717114155.56222-1-hdegoede@redhat.com>
 <20200719225649.GA4341@khazad-dum.debian.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719225649.GA4341@khazad-dum.debian.net>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
> On Fri, 17 Jul 2020, Hans de Goede wrote:
> > This is a simple patch-series adding support for 3 new hotkeys found
> > on various new Lenovo Thinkpad models.
> 
> For all three patches, pending an ack for the new keycodes by the input
> maintainers:
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Do you want me to merge all 3 through input tree?

Thanks.

-- 
Dmitry
