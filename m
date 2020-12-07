Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A9C2D0E14
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 11:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgLGKeG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 05:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51503 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726567AbgLGKeG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Dec 2020 05:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607337159;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fLRBDCx4LhnnGAG07LCQHN7OdMjKYN8jEHzv7PkPs8I=;
        b=OeRim8LagHWwMrRaS1dikyOZC2O8ejYNWZA7x0/zS84akbcWWZ02Fq1Rb1K2W1g52z0vVg
        5Z1A91PoAodHjxB6cGKMfqOb1q3f6DBVqdB5aReTMI89ci6RQAh5mfDmqPcPGis3yC2cXe
        o+R46K6IY6hHX3uOLqLyCVXOUXT3pas=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-6DUUl770MsiZ7PzRynLBYg-1; Mon, 07 Dec 2020 05:32:35 -0500
X-MC-Unique: 6DUUl770MsiZ7PzRynLBYg-1
Received: by mail-ed1-f69.google.com with SMTP id dc6so5582912edb.14
        for <linux-input@vger.kernel.org>; Mon, 07 Dec 2020 02:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fLRBDCx4LhnnGAG07LCQHN7OdMjKYN8jEHzv7PkPs8I=;
        b=YRN8dXAfzO3h+qmlHdbl2itJKT48huL1CJ8qG2pyPlgxrYd3jYgID5G54FyRJUBZLn
         L4u/CRV60l07PQ8xsQh+tlLEocrXag3LVjS/e2K1eOyh71qxdfVOKbyszRqZkri3DAGx
         P+0aDYYe7OpmlFMyhLuXn6j5TMyDCDJvrpvicSWosUIIOUxcR2gmU9AR6jtD8/B38ljZ
         Xb/kKhpmuUYTOW4hZSGQv+/R+q3Fr9JwWf7oOF0sSISdXw5GClk5YEN9EVVlrIvdW2wR
         i5xFKixqegf/YutHmGLtlPoks/ekZVF6ve2VjJpO46F0HB3iCMtTm9YM7bbgY3ghEuUw
         YsUg==
X-Gm-Message-State: AOAM533/PQjyaX+dCQWECzsKdhaiJ4Olv7qZfdciPMdPSMad9LGDmWTV
        cc+58U206/AbFkhIECKl7wjKXwjJL8lcUI0SO0tyPLIqk4n6gb6DHLCHaE23ReXpZeTmEL/csUx
        dR8kjkBvyNFOVEhEzLuSYf/kAOtyn4avN6r2/Luk2Ve1qQPpJMxy3odrqFCZUGG+MU+IppKm03f
        E=
X-Received: by 2002:a17:907:36a:: with SMTP id rs10mr17693522ejb.411.1607337153659;
        Mon, 07 Dec 2020 02:32:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfP1DGa7yDFHvBgYRcA99vYPwEvuRRglf5hMtWIo24BOFiD32DPp3iDEp7D4lrwEKY3EwI9A==
X-Received: by 2002:a17:907:36a:: with SMTP id rs10mr17693510ejb.411.1607337153485;
        Mon, 07 Dec 2020 02:32:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id l22sm11906287ejk.14.2020.12.07.02.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 02:32:32 -0800 (PST)
Subject: Re: [RFC 0/3] HID: logitech-dj: Dinovo keyboard fixes and
 improvements
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20201114212058.19590-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <30eed8f6-1600-f36f-0a9c-b8905d66a7f4@redhat.com>
Date:   Mon, 7 Dec 2020 11:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201114212058.19590-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/14/20 10:20 PM, Hans de Goede wrote:
> Hi Benjamin,
> 
> Here is my patch series for the discussed Dinovo keyboard (receiver)
> support improvements.
> 
> I've marked this as a RFC since it has not been tested with a Dinovo Mini
> (nor a Dinovo Mini receiver) yet.
> 
> I have tested it extensively with a Dinovo Edge, a MX5000 and a MX5500
> keyboard. In case of the Dinovo Edge and MX5000 I've not only tested
> them against their own receiver but also against each-others receiver.
> 
> Once you have tested this series on your Dinovo Mini, it is ready to
> go upstream. The first patch should probably go to 5.10 as a fix in
> case someone pairs the Dinovo Mini with a MX5x00 receiver like the
> reporter of this bug did with his Dinovo Edge:
> https://bugzilla.redhat.com/show_bug.cgi?id=1811424
> 
> The other 2 are 5.11 material.

IIRC we agreed (after Benjamin tested this series with his Dinovo Mini)
that this series was ready to go upstream as is.

Patch 1/3 of this has already been merged since it is a bug-fix.

But patch 2/3 and 3/3 are not in for-next. They should be ready
to go as-is, but let me know if you want me to resend them as
non RFC patches.

Regards,

Hans

