Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F56833AA
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 16:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfHFOLW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 10:11:22 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37065 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfHFOLV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Aug 2019 10:11:21 -0400
Received: by mail-qt1-f193.google.com with SMTP id y26so84657380qto.4
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2019 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBCtelBS4WKeSo1WdPYyCPiwUzClPJaIdyPAjiRPZbg=;
        b=XX0u81X+Ycq1c783ouR7CelWBeRq+glvqyKgH8mkwKM0wf5uxE4nry2/MP1b6ZW7Ua
         HGQF6YmZxsx3/vkzmbOJsB6UPCo7Fn97ycJ5OV0d02wi09RKJlzmLM4CDpXPCd8q8DeQ
         Tz475QyCBmW3L8IJka0CCOBIlTqv4jn1ELvq3PlLHHunbVBm7uDM6tJt/DWm46zUcOAw
         z0hLF6QJvocYNQJEnZGJFvgyJHW3xgSPHR7vWnSCLHoSZcMtprZ+60sqD0EN2wiys93l
         s9NJhRWPjC6F8rziJzwxcQc/oibmp1vNJrAzhqeG2iVR3+PyzA1EcVC5OgmHvTJXCNPv
         6BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBCtelBS4WKeSo1WdPYyCPiwUzClPJaIdyPAjiRPZbg=;
        b=N9/uBki4ZEyhemMwpdzigYI0qaJoZLVhCllTGiUs9zuVOqo6EwVKZBDUUApVsnvbpJ
         NFhDU9wK8H0qLt7npMx7CLjCknSe8tdYJ3Z/TqHmQWqKPYiGUSOkFSuzBI4s1BqX917q
         SriMpOVY6qcWr+W/Cq/YE52hB/MuzhN2pa6QPPuqVpESJuZVfOisqYWqRzvNvYwRtxaB
         O9uouN9k0n0HI4H0gEj5e1Jc1FjxiyfWjETSmEAHmImmkSdb5je8TXcFYPzhirL51Miz
         2W8HxrYmLVs1fkELQb2KqW/ATc4ypPY1KQ+4R3cw1x7FihZXSnqPuFmo1PniUL6v5rva
         pSQw==
X-Gm-Message-State: APjAAAUtAqzz6Bgr1Qjo1sD3YAb3EjPQJSto7XUyPgmVJQEUpxiuUsYE
        6tyGrxzpi+g33Mn2MsDVBR1U05Y/bOdBDvpzT0d3zA==
X-Google-Smtp-Source: APXvYqxRHYZsuOfjyBhEZ3+/LEJ3bLyPY2vJm/7ebaC0Av5+OL+nNyKfyYdqebpabvk8ADCkXHXS6X6OGy0bH+JUiWQ=
X-Received: by 2002:a0c:8dc7:: with SMTP id u7mr3201980qvb.41.1565100680984;
 Tue, 06 Aug 2019 07:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150212.27967-1-abbotti@mev.co.uk>
In-Reply-To: <20190626150212.27967-1-abbotti@mev.co.uk>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Tue, 6 Aug 2019 16:11:10 +0200
Message-ID: <CANq1E4SbWctPSd998ECp4ZkVjsyYj7Ty=9YVcqBy4_qbrunwHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] HID: wiimote: Minor change to spinlock usage
To:     Ian Abbott <abbotti@mev.co.uk>, Jiri Kosina <jikos@kernel.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey

On Wed, Jun 26, 2019 at 5:02 PM Ian Abbott <abbotti@mev.co.uk> wrote:
>
> A couple of minor changes to the wiimote core module.  They do not
> change functionality of the driver:
>
> 1) HID: wiimote: make handlers[] const
> 2) HID: wiimote: narrow spinlock range in wiimote_hid_event()
>
>  drivers/hid/hid-wiimote-core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Both changes look good to me:

Reviewed-by: David Herrmann <dh.herrmann@gmail.com>

Thanks!
David
