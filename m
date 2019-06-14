Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706C5467E7
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 20:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfFNSzh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 14:55:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46592 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFNSzh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 14:55:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so1351619pls.13;
        Fri, 14 Jun 2019 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YPRfZ3Acf8Ln7fWGUnEyPsHNaWo6nLpRMmmXFpve7Ac=;
        b=Elgjv0rWDq+CXwqeT+0MqZJ1XefmSArPHMhGcBIU/E8DQ5/K4zc8sHFwX31jJ7kyH/
         6cjcDlxerKHXbwW/iJXWO8/E0arBlnxt65PiqWrEu4BtJ/4f2YdqRfybgLEnIqRqeI6V
         VCx/FHsZsxjpemTbYuZcH47f3/lHZeTH5wJ8unyV+x7SHUr2L9cW0ebnw3ZnXD0K4ygW
         vVu+ohu1ElWLNYSMoVsEI9Tl963jVNXr6hRrGZC9qLa8EsEEBekuLoDHGtFD5wt60IER
         dSCKbBbPArZZwNSaF4Wmti9Ap5QaPxWdpSywPpaT3DHSJa6xEFa0E7ciTR4/b9DxnP2g
         qrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YPRfZ3Acf8Ln7fWGUnEyPsHNaWo6nLpRMmmXFpve7Ac=;
        b=MZ1WrIFZNHVjoWFmuIToa9DDvl3GZbg22uU2wXxdBtpJ6xrqKXQdGD68y3k7kZVbF/
         vbMKV8OnYhe6hK43Au5diovvM0zX72jNGlzNAfP/xdlI5nLUMzlwurEb2GfaA3NVxkks
         vbxNLcsBsep95lzoiGstpO+/j4L27aJ7bOfbx1NygS7vxbO2RRDLYFkf+UYr+qLJGV+I
         M2W4PV472gDTc1KxmnJXfVKx1jt0dd+63ECFLlgDkFKtWyJ80he2nMkVfSn4Q1vFFmvO
         aZ7fTHNtpcbuhn9Fe09JE1WjRrzODSbd/C2VT46sXSNWS2iEE/OCOs0X7XTLp6XJLaep
         sVog==
X-Gm-Message-State: APjAAAWpwnKNHUejtfNZgVzbDQoNPfUh86dPA190s1lmHfd/Xws9Dz5J
        K9tembpcLAMXJyJIM9hLKUE=
X-Google-Smtp-Source: APXvYqwv+Ov1MINtpZCaO5aFC7LEfdLTjF9wmGZNnEnywAwTxfyk1TU1b4bUd/fCDOj21QQxw8YeKQ==
X-Received: by 2002:a17:902:363:: with SMTP id 90mr9281967pld.340.1560538536305;
        Fri, 14 Jun 2019 11:55:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a186sm4122291pfa.188.2019.06.14.11.55.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 11:55:35 -0700 (PDT)
Date:   Fri, 14 Jun 2019 11:55:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Enrico Granata <egranata@google.com>
Cc:     Ting Shen <phoenixshen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: mask out extra flags in event_type
Message-ID: <20190614185533.GA142889@dtor-ws>
References: <20190614065438.142867-1-phoenixshen@chromium.org>
 <CAPR809sASD=MrQkJULVBgc_iqiPKE2xr8eUR0d4qymQkLUYRaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPR809sASD=MrQkJULVBgc_iqiPKE2xr8eUR0d4qymQkLUYRaw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 14, 2019 at 11:27:03AM -0700, Enrico Granata wrote:
> On Thu, Jun 13, 2019 at 11:54 PM Ting Shen <phoenixshen@chromium.org> wrote:
> >
> > http://crosreview.com/1341159 added a EC_MKBP_HAS_MORE_EVENTS flag to
> > the event_type field, the receiver side should mask out this extra bit when
> > processing the event.
> >
> > Signed-off-by: Ting Shen <phoenixshen@chromium.org>
> 
> Reviewed-by: Enrico Granata <egranata@google.com>

EC_MKBP_EVENT_TYPE_MASK is not in Linus' tree. It would be better to
merge this path through whatever tree that is bringing in that
definition.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
