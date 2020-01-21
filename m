Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF48A1435C4
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 03:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbgAUCtw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 21:49:52 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43244 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgAUCtw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 21:49:52 -0500
Received: by mail-vs1-f65.google.com with SMTP id s16so820875vsc.10
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2020 18:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVR1nDK7Xg5KrjRylGfSLD7HD0BP/xruOKJsXFprvSY=;
        b=qkspBWWDOK4pgD5KP0OMywIAllB1DOGEM9s7MFEjTg1fry8uKUaW3TYit3Em6fF5x7
         zfO8fjrERAoiLlysE4hgYQ787kR1R+xG8ytcpUTvPPm/s9VjWtYshAbgRBjmTmFCwlOV
         CBYdjqprJ//JrIPOX5D1Ko0oIL1DByOB9bjCAn0yOR1nvxd9JjKJfYG0O6VrI7VEAeBl
         HYMuWPO/PdQRdVuQcszLeSkQoBylBxcevvNC2jp7a2mbuBoQGXxltYAD1QwTLO4sRDVG
         7L9yx/1R84KhAyampxHNOnh5UxxxN/mhEnchJDRLjC829YuY1mlYLaE9L9grEiVjyhD1
         sETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVR1nDK7Xg5KrjRylGfSLD7HD0BP/xruOKJsXFprvSY=;
        b=Hc2Vj4da/GjSroKa9FF1X5kImXsQ5T3F5kdIcg93M3bYlmbrUlR7KXgQqxziZCVqD2
         /g70iYuojPaDI5seo+emee47O7t4GWhNV+qVdDXePWV/CmD+5D8evffZQ/kG6JLufG51
         a0dtFxijuxieSU1BQ+BClzwEx0TWcdyXozc85yMMSyu3qdg3E3P4agBlE8YuZK0hVnnw
         xdaQCS+7Bc4Sp7/4mX7dhj4fDzQTD+LanJKOVOzlD3EmYYGyrMxQMwqNePrKZGazLGH9
         8U0yBSsufDb4wMzkKFZFNs8Bglf+hw+dCXs94dyR6jjVhQ1N/Vgu0chio1Rchd+Qbygv
         643g==
X-Gm-Message-State: APjAAAX4cI3laJIWcqDpa2ekfyvEiqb2UOAqgzdmNcgZXmqU2eF0pkKe
        CGyII20SCScldTriR+Nd9Z7QrvCbwx85B7o8g0s=
X-Google-Smtp-Source: APXvYqyf9xlxuiJxmluGJqGxOlmXw11xNYqXX2RNcCtFvQZtHr5MJI5sSOK+FvlGIEv97d6NgLmXbs0gVKGeshurZwE=
X-Received: by 2002:a05:6102:3024:: with SMTP id v4mr1329447vsa.220.1579574990475;
 Mon, 20 Jan 2020 18:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20191230012720.2368987-1-djogorchock@gmail.com>
 <20191230012720.2368987-12-djogorchock@gmail.com> <CAEc3jaBy9c=GTXX1iuQsCn8N2vg4zG1trzddRtsmQLsX4YO7oA@mail.gmail.com>
 <CAEVj2tnt4FnQiiaVJgbaKaeGQqMk6CUkmvy2KjRk2Ew79USaaw@mail.gmail.com>
 <CAEc3jaBsxOD1Cs1231+mabVqx2dLGZ0hW8aH3dbXFbt5n50Qpw@mail.gmail.com>
 <CAPh2-TB=UZhHAWfsyPBpATT79qeKzzOwo41VDPpid6NH7kUYJA@mail.gmail.com>
 <CAEVj2tnxVNXLje3Y0+2Rnfr9Pje88cfvmvOXHk1UuL8g9W3j0w@mail.gmail.com>
 <CAEc3jaBo2LHh==_K8_EM+NVQ+pkO6HvoTVtq145dBicPQO-Suw@mail.gmail.com> <CAPh2-TBNHH=RjZcgKzXCKysKKX23yGesXq-AzqaWr1+y4+gAdQ@mail.gmail.com>
In-Reply-To: <CAPh2-TBNHH=RjZcgKzXCKysKKX23yGesXq-AzqaWr1+y4+gAdQ@mail.gmail.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Mon, 20 Jan 2020 20:49:39 -0600
Message-ID: <CAEVj2tn2U_--W985VMwVk_yJ_LRWWPrKq_y5dsT2fiignM7bYw@mail.gmail.com>
Subject: Re: [PATCH v10 11/12] HID: nintendo: add IMU support
To:     Carl Mueller <carmueller@gmail.com>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Does anyone else have an opinion on this? I agree with Carl that the
D-pad cannot register opposite direction inputs simultaneously.

Thanks,
Daniel

On Thu, Jan 9, 2020 at 2:39 PM Carl Mueller <carmueller@gmail.com> wrote:
>
> Hi Roderick,
>
> The Switch Pro Controller D-pad functions as a D-pad.  You cannot push
> left and right at the same time.
>
> Also, the Switch Pro Controller already functions as a controller when
> connected with Bluetooth and
> using the standard Linux device driver.  In this case, the D-pad is
> registered as a Hat.
> I'd prefer if we didn't change this.
>
>
> On Thu, Jan 9, 2020 at 11:38 AM Roderick Colenbrander
> <thunderbird2k@gmail.com> wrote:
> >
> > Hi Daniel,
> >
> > Whether to report as HAT or BTN_DPAD depends on how the hardware works
> > internally. You see the HAT vs buton at the HID report layer (it is
> > quite different), but if you just touch the controller sticks you will
> > also notice. A HAT axis is really like a joystick e.g. with a range -1
> > to +1. If you hold down e.g. "left" and "right" on a d-pad, you would
> > get "0" back as you are unable to press both left and right at the
> > same time. With d-pad buttons you could press left and right at the
> > same time (depending on design).
> >
> > When I just tried my Switch Pro controller it really felt like the
> > d-pad were buttons. Various other controllers using BTN_DPAD as well
> > for example DualShock 3. Most applications these days should use SDL2,
> > which will hide that.
> >
> > Thanks,
> > Roderick
> >
> > On Thu, Jan 9, 2020 at 12:53 AM Daniel Ogorchock <djogorchock@gmail.com> wrote:
> > >
> > > Hi Carl,
> > >
> > > When I was initially implementing the button mappings, I referred to the
> > > standard described here:
> > >     https://www.kernel.org/doc/html/latest/input/gamepad.html
> > >
> > > It mentions under the d-pad section that digital inputs should be
> > > reported using the BTN_DPAD_* variant. Do the other controllers
> > > mentioned report their d-pads as analog values, or has using the
> > > ABS_HAT* values become the de facto format for digital inputs
> > > as well?
> > >
> > > If the latter, I guess it would make sense to go with the crowd for the pro.
> > > It just seems a bit odd to report digital inputs as absolute axes, but I'm
> > > open to changing it if that's the consensus.
> > >
> > > Thanks,
> > > Daniel
> > >
> > > On Thu, Jan 9, 2020 at 12:23 AM Carl Mueller <carmueller@gmail.com> wrote:
> > > >
> > > > (3rd/final attempt at reply due to list server rejecting message with
> > > > HTML subpart; sorry about the spam!)
> > > >
> > > > Hi Everyone,
> > > >
> > > > In trying out this driver to use with the Switch Pro Controller,
> > > > the biggest difficulty I had was that the D-pad is reported as buttons
> > > > instead of as a Hat.  All other controllers that are similar in structure
> > > > (such as the PS3 and PS4 controllers, the Xbox controllers, and many
> > > > others) report the D-pad as a Hat.  This kind of consistency is needed
> > > > to avoid lots of software compatibility issues.
> > > >
> > > > I mentioned this to Daniel, and he indicated that he wanted the Switch
> > > > Pro Controller to behave like the JoyCons, which have buttons instead
> > > > of a D-pad.  Having the JoyCons report the buttons as buttons makes
> > > > sense, since it's possible to push opposite directions at the same time.
> > > > However, I don't think that the argument carries over to the Switch Pro
> > > > Controller, since it has a physically different control.
> > > >
> > > > Again, the consistency with the other controllers that have all the same
> > > > physical structure and the same types of controls seems more important
> > > > to me than consistency with a controller that is physically much different.
> > > > Additionally, many games are already written for use with controllers
> > > > that look like the Switch Pro Controller, whereas fewer are written for use
> > > > with Nintendo JoyCons.  If we have to cause trouble for one side or the
> > > > other, let's not cause trouble with the more established side.
> > > >
> > > > On Thu, Jan 9, 2020 at 12:22 AM Roderick Colenbrander
> > > > <thunderbird2k@gmail.com> wrote:
> > > > >
> > > > > Hi Daniel,
> > > > >
> > > > > Unfortunately there is no public test application at the moment to
> > > > > illustrate these features. I agree something is definitely needed.
> > > > >
> > > > > I need to see if we can come up with something. One of the test apps
> > > > > we have internally is a 3D cube, which is controllable by controller
> > > > > motion. It of course shows the gyro / accelerometer values, but the
> > > > > position of the cube is tied to the calculated orientation. If
> > > > > something is off you will see weird movements in the cube or drift
> > > > > building up over time etcetera.
> > > > >
> > > > > Though it would take some time to prepare something. The rest of the
> > > > > patch series looked fine I think, so the IMU parts may need to wait
> > > > > for a next kernel cycle, but all the other plumbing could go in (if
> > > > > others are okay of course).
> > > > >
> > > > > Thanks,
> > > > > Roderick
> > > > >
> > > > > On Wed, Jan 8, 2020 at 7:26 PM Daniel Ogorchock <djogorchock@gmail.com> wrote:
> > > > > >
> > > > > > Hi Roderick,
> > > > > >
> > > > > > Thanks for the feedback. In addition to the inline comments below,
> > > > > > do you have any recommendations for test programs that you
> > > > > > know work well with hid-sony's gyro implementation? Up to this
> > > > > > point I've just been using evtest, which obviously isn't too useful
> > > > > > for testing actual functionality of the gyro in an intuitive way.
> > > > > >
> > > > > > On Tue, Dec 31, 2019 at 12:29 AM Roderick Colenbrander
> > > > > > <thunderbird2k@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Daniel,
> > > > > > >
> > > > > > > I had some time to review the motion sensors patch. I have added some
> > > > > > > feedback inline with your patch below.
> > > > > > >
> > > > > > > Aside from standard feedback on the code, I wanted to have a close
> > > > > > > look at the accelerometer / gyro data. My team has been doing a lot of
> > > > > > > work on this (and still is) and I want to make sure any work we do on
> > > > > > > "user space" software (e.g. Android) automatically works for Joycon as
> > > > > > > well. The accuracy of the data is very important else applications
> > > > > > > will make bad decisions. Userspace applications often combine the data
> > > > > > > of both sensors to calculate a position for position tracking.
> > > > > > > Inaccurate axes ranges or wrong precision can cause major issues. I
> > > > > > > may be a bit strict below, but it will just be to prevent headaches
> > > > > > > for others later on. I use the DS4 as a reference point as it was the
> > > > > > > first device (aside from Wii early on) where we properly report
> > > > > > > acceleration and gyro axes with INPUT_PROP_ACCELEROMETER and we should
> > > > > > > be consistent with it here else applications could be confused, so we
> > > > > > > should use similar orientation of axes and resolutions.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Roderick
> > > > > > >
> > > > > > > On Sun, Dec 29, 2019 at 5:27 PM Daniel J. Ogorchock
> > > > > > > <djogorchock@gmail.com> wrote:
> > > > > > > >
> > > > > > > > This patch adds support for the controller's IMU. The accelerometer and
> > > > > > > > gyro data are both provided to userspace using a second input device.
> > > > > > > > The devices can be associated using their uniq value (set to the
> > > > > > > > controller's MAC address).
> > > > > > > >
> > > > > > > > The majority of this patch's functinoality was provided by Carl Mueller.
> > > > > > > >
> > > > > > > > Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/hid/hid-nintendo.c | 267 +++++++++++++++++++++++++++++++++++--
> > > > > > > >  1 file changed, 259 insertions(+), 8 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > > > > > > > index 7b7a0cf3fe0b..edf2ef140cb3 100644
> > > > > > > > --- a/drivers/hid/hid-nintendo.c
> > > > > > > > +++ b/drivers/hid/hid-nintendo.c
> > > > > > > > @@ -101,12 +101,29 @@ static const u16 JC_CAL_DATA_START                = 0x603d;
> > > > > > > >  static const u16 JC_CAL_DATA_END               = 0x604e;
> > > > > > > >  #define JC_CAL_DATA_SIZE       (JC_CAL_DATA_END - JC_CAL_DATA_START + 1)
> > > > > > > >
> > > > > > > > +/* SPI storage addresses of IMU factory calibration data */
> > > > > > > > +static const u16 JC_IMU_CAL_DATA_START         = 0x6020;
> > > > > > > > +static const u16 JC_IMU_CAL_DATA_END           = 0x6037;
> > > > > > > > +#define JC_IMU_CAL_DATA_SIZE \
> > > > > > > > +                       (JC_IMU_CAL_DATA_END - JC_IMU_CAL_DATA_START + 1)
> > > > > > > >
> > > > > > > >  /* The raw analog joystick values will be mapped in terms of this magnitude */
> > > > > > > >  static const u16 JC_MAX_STICK_MAG              = 32767;
> > > > > > > >  static const u16 JC_STICK_FUZZ                 = 250;
> > > > > > > >  static const u16 JC_STICK_FLAT                 = 500;
> > > > > > > >
> > > > > > > > +/* The accel axes will be mapped in terms of this magnitude */
> > > > > > > > +static const u16 JC_MAX_ACCEL_MAG              = 32767;
> > > > > > > > +static const u16 JC_ACCEL_RES                  = 4096;
> > > > > > >
> > > > > > > What does the acceleration resolution equate to? For DS4 we use
> > > > > > > multiples of 'g'. (We don't know the position on earth, so can't
> > > > > > > report in m/s^2).
> > > > > > >
> > > > > > > > +static const u16 JC_ACCEL_FUZZ                 = 10;
> > > > > > > > +static const u16 JC_ACCEL_FLAT                 /*= 0*/;
> > > > > > > > +
> > > > > > > > +/* The gyro axes will be mapped in terms of this magnitude */
> > > > > > > > +static const u16 JC_MAX_GYRO_MAG               = 32767;
> > > > > > > > +static const u16 JC_GYRO_RES                   = 13371 / 936; /* 14 (14.285) */
> > > > > > >
> > > > > > > What does the gyro resolution equate to? For DS4 we report "degrees
> > > > > > > per second". We should do the same for the joycons, but I don't know
> > > > > > > how you guys figured out the exact resolution. As I mentioned if it is
> > > > > > > not accurate, applications will make wrong calculations.
> > > > > > >
> > > > > > > > +static const u16 JC_GYRO_FUZZ                  = 10;
> > > > > > > > +static const u16 JC_GYRO_FLAT                  /*= 0*/;
> > > > > > > > +
> > > > > > > >  /* frequency/amplitude tables for rumble */
> > > > > > > >  struct joycon_rumble_freq_data {
> > > > > > > >         u16 high;
> > > > > > > > @@ -234,6 +251,11 @@ struct joycon_stick_cal {
> > > > > > > >         s32 center;
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +struct joycon_imu_cal {
> > > > > > > > +       s16 offset[3];
> > > > > > > > +       s16 scale[3];
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  /*
> > > > > > > >   * All the controller's button values are stored in a u32.
> > > > > > > >   * They can be accessed with bitwise ANDs.
> > > > > > > > @@ -281,6 +303,19 @@ struct joycon_subcmd_reply {
> > > > > > > >         u8 data[0]; /* will be at most 35 bytes */
> > > > > > > >  } __packed;
> > > > > > > >
> > > > > > > > +struct joycon_imu_data {
> > > > > > > > +       s16 accel_x;
> > > > > > > > +       s16 accel_y;
> > > > > > > > +       s16 accel_z;
> > > > > > > > +       s16 gyro_x;
> > > > > > > > +       s16 gyro_y;
> > > > > > > > +       s16 gyro_z;
> > > > > > > > +} __packed;
> > > > > > > > +
> > > > > > > > +struct joycon_imu_report {
> > > > > > > > +       struct joycon_imu_data data[3];
> > > > > > > > +} __packed;
> > > > > > >
> > > > > > > See comments later on about imu_data, but you can't directly cast your
> > > > > > > data buffer to this data type due to endian issues. It may not really
> > > > > > > make sense to keep the data structure as you need to do manual data
> > > > > > > fetching.
> > > > > > >
> > > > > > > > +
> > > > > > > >  struct joycon_input_report {
> > > > > > > >         u8 id;
> > > > > > > >         u8 timer;
> > > > > > > > @@ -290,11 +325,10 @@ struct joycon_input_report {
> > > > > > > >         u8 right_stick[3];
> > > > > > > >         u8 vibrator_report;
> > > > > > > >
> > > > > > > > -       /*
> > > > > > > > -        * If support for firmware updates, gyroscope data, and/or NFC/IR
> > > > > > > > -        * are added in the future, this can be swapped for a union.
> > > > > > > > -        */
> > > > > > > > -       struct joycon_subcmd_reply reply;
> > > > > > > > +       union {
> > > > > > > > +               struct joycon_subcmd_reply subcmd_reply;
> > > > > > > > +               struct joycon_imu_report imu_report;
> > > > > > >
> > > > > > > maybe add a raw byte array to this union. Could help for parsing the imu data.
> > > > > > > > +       };
> > > > > > > >  } __packed;
> > > > > > > >
> > > > > > > >  #define JC_MAX_RESP_SIZE       (sizeof(struct joycon_input_report) + 35)
> > > > > > > > @@ -334,6 +368,9 @@ struct joycon_ctlr {
> > > > > > > >         struct joycon_stick_cal right_stick_cal_x;
> > > > > > > >         struct joycon_stick_cal right_stick_cal_y;
> > > > > > > >
> > > > > > > > +       struct joycon_imu_cal accel_cal;
> > > > > > > > +       struct joycon_imu_cal gyro_cal;
> > > > > > > > +
> > > > > > > >         /* power supply data */
> > > > > > > >         struct power_supply *battery;
> > > > > > > >         struct power_supply_desc battery_desc;
> > > > > > > > @@ -352,6 +389,10 @@ struct joycon_ctlr {
> > > > > > > >         u16 rumble_lh_freq;
> > > > > > > >         u16 rumble_rl_freq;
> > > > > > > >         u16 rumble_rh_freq;
> > > > > > > > +
> > > > > > > > +       /* imu */
> > > > > > > > +       struct input_dev *imu_input;
> > > > > > > > +       int timestamp;
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
> > > > > > > > @@ -547,7 +588,7 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
> > > > > > > >         }
> > > > > > > >
> > > > > > > >         report = (struct joycon_input_report *)ctlr->input_buf;
> > > > > > > > -       raw_cal = &report->reply.data[5];
> > > > > > > > +       raw_cal = &report->subcmd_reply.data[5];
> > > > > > > >
> > > > > > > >         /* left stick calibration parsing */
> > > > > > > >         cal_x = &ctlr->left_stick_cal_x;
> > > > > > > > @@ -601,6 +642,85 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
> > > > > > > >         return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static const s16 DFLT_ACCEL_OFFSET /*= 0*/;
> > > > > > > > +static const s16 DFLT_ACCEL_SCALE = 16384;
> > > > > > > > +static const s16 DFLT_GYRO_OFFSET /*= 0*/;
> > > > > > > > +static const s16 DFLT_GYRO_SCALE  = 13371;
> > > > > > > > +static int joycon_request_imu_calibration(struct joycon_ctlr *ctlr)
> > > > > > > > +{
> > > > > > > > +       struct joycon_subcmd_request *req;
> > > > > > > > +       u8 buffer[sizeof(*req) + 5] = { 0 };
> > > > > > > > +       struct joycon_input_report *report;
> > > > > > > > +       u8 *data;
> > > > > > > > +       u8 *raw_cal;
> > > > > > > > +       int ret;
> > > > > > > > +       int i;
> > > > > > > > +
> > > > > > > > +       /* request IMU calibration data */
> > > > > > > > +       req = (struct joycon_subcmd_request *)buffer;
> > > > > > > > +       req->subcmd_id = JC_SUBCMD_SPI_FLASH_READ;
> > > > > > > > +       data = req->data;
> > > > > > > > +       data[0] = 0xFF & JC_IMU_CAL_DATA_START;
> > > > > > > > +       data[1] = 0xFF & (JC_IMU_CAL_DATA_START >> 8);
> > > > > > > > +       data[2] = 0xFF & (JC_IMU_CAL_DATA_START >> 16);
> > > > > > > > +       data[3] = 0xFF & (JC_IMU_CAL_DATA_START >> 24);
> > > > > > >
> > > > > > > Maybe use put_unaligned_le32? I think it allows you to avoid doing all
> > > > > > > these calculations yourself:
> > > > > > > put_unaligned_le32(JC_IMU_CAL_DATA_START, data);
> > > > > > >
> > > > > > > > +       data[4] = JC_IMU_CAL_DATA_SIZE;
> > > > > > > > +
> > > > > > > > +       hid_dbg(ctlr->hdev, "requesting IMU cal data\n");
> > > > > > > > +       ret = joycon_send_subcmd(ctlr, req, 5, HZ);
> > > > > > > > +
> > > > > > > > +       if (ret) {
> > > > > > > > +               hid_warn(ctlr->hdev,
> > > > > > > > +                        "Failed to read IMU cal, using defaults; ret=%d\n",
> > > > > > > > +                        ret);
> > > > > > > > +
> > > > > > > > +               for (i = 0; i < 3; i++) {
> > > > > > > > +                       ctlr->accel_cal.offset[i] = DFLT_ACCEL_OFFSET;
> > > > > > > > +                       ctlr->accel_cal.scale[i] = DFLT_ACCEL_SCALE;
> > > > > > > > +                       ctlr->gyro_cal.offset[i] = DFLT_GYRO_OFFSET;
> > > > > > > > +                       ctlr->gyro_cal.scale[i] = DFLT_GYRO_SCALE;
> > > > > > > > +               }
> > > > > > > > +               return ret;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       report = (struct joycon_input_report *)ctlr->input_buf;
> > > > > > > > +       raw_cal = &report->subcmd_reply.data[5];
> > > > > > > > +
> > > > > > > > +       /* IMU calibration parsing */
> > > > > > > > +       for (i = 0; i < 3; i++) {
> > > > > > > > +               int j = i * 2;
> > > > > > > > +
> > > > > > > > +               ctlr->accel_cal.offset[i] = raw_cal[j + 0] |
> > > > > > > > +                                               ((s16)raw_cal[j + 1] << 8);
> > > > > > > > +               ctlr->accel_cal.scale[i] = raw_cal[j + 6] |
> > > > > > > > +                                               ((s16)raw_cal[j + 7] << 8);
> > > > > > > > +               ctlr->gyro_cal.offset[i] = raw_cal[j + 12] |
> > > > > > > > +                                               ((s16)raw_cal[j + 13] << 8);
> > > > > > > > +               ctlr->gyro_cal.scale[i] = raw_cal[j + 18] |
> > > > > > > > +                                               ((s16)raw_cal[j + 19] << 8);
> > > > > > >
> > > > > > > get_unaligned_le16 instead of doing your own bitshifts?
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +       hid_dbg(ctlr->hdev, "IMU calibration:\n"
> > > > > > > > +                           "a_o[0]=%d a_o[1]=%d a_o[2]=%d\n"
> > > > > > > > +                           "a_s[0]=%d a_s[1]=%d a_s[2]=%d\n"
> > > > > > > > +                           "g_o[0]=%d g_o[1]=%d g_o[2]=%d\n"
> > > > > > > > +                           "g_s[0]=%d g_s[1]=%d g_s[2]=%d\n",
> > > > > > > > +                           ctlr->accel_cal.offset[0],
> > > > > > > > +                           ctlr->accel_cal.offset[1],
> > > > > > > > +                           ctlr->accel_cal.offset[2],
> > > > > > > > +                           ctlr->accel_cal.scale[0],
> > > > > > > > +                           ctlr->accel_cal.scale[1],
> > > > > > > > +                           ctlr->accel_cal.scale[2],
> > > > > > > > +                           ctlr->gyro_cal.offset[0],
> > > > > > > > +                           ctlr->gyro_cal.offset[1],
> > > > > > > > +                           ctlr->gyro_cal.offset[2],
> > > > > > > > +                           ctlr->gyro_cal.scale[0],
> > > > > > > > +                           ctlr->gyro_cal.scale[1],
> > > > > > > > +                           ctlr->gyro_cal.scale[2]);
> > > > > > > > +
> > > > > > > > +       return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
> > > > > > > >  {
> > > > > > > >         struct joycon_subcmd_request *req;
> > > > > > > > @@ -627,6 +747,19 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
> > > > > > > >         return joycon_send_subcmd(ctlr, req, 1, HZ/4);
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static int joycon_enable_imu(struct joycon_ctlr *ctlr, bool enable)
> > > > > > > > +{
> > > > > > > > +       struct joycon_subcmd_request *req;
> > > > > > > > +       u8 buffer[sizeof(*req) + 1] = { 0 };
> > > > > > > > +
> > > > > > > > +       req = (struct joycon_subcmd_request *)buffer;
> > > > > > > > +       req->subcmd_id = JC_SUBCMD_ENABLE_IMU;
> > > > > > > > +       req->data[0] = enable ? 0x01 : 0x00;
> > > > > > > > +
> > > > > > > > +       hid_dbg(ctlr->hdev, "%s IMU\n", enable ? "enabling" : "disabling");
> > > > > > > > +       return joycon_send_subcmd(ctlr, req, 1, HZ);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
> > > > > > > >  {
> > > > > > > >         s32 center = cal->center;
> > > > > > > > @@ -771,6 +904,54 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
> > > > > > > >                 spin_unlock_irqrestore(&ctlr->lock, flags);
> > > > > > > >                 wake_up(&ctlr->wait);
> > > > > > > >         }
> > > > > > > > +
> > > > > > > > +       /* parse IMU data if present */
> > > > > > > > +       if (rep->id == JC_INPUT_IMU_DATA) {
> > > > > > > > +               struct joycon_imu_data *imu_data = rep->imu_report.data;
> > > > > > >
> > > > > > > I don't think you can directly covert your input report data to
> > > > > > > imu_data. Until now you have been lucky enough (based on a quick
> > > > > > > glance of the the other patches) that your data are single bytes.
> > > > > > > However, this data seems to be a bunch of s16's. In other words you
> > > > > > > have to deal with endianess issues. You need to use get_unaligned_le16
> > > > > > > to retrieve data from your raw byte buffer. See other HID drivers for
> > > > > > > reference.
> > > > > >
> > > > > > Ah, good point. I'd overlooked that entirely.
> > > > > >
> > > > > > >
> > > > > > > Since you will have to use get_unaligned_le16, it probably won't make
> > > > > > > much sense to really have a joycon_imu_data structure. Maybe extend
> > > > > > > your input_buffer union with raw bytes and in this case just use raw
> > > > > > > bytes. Each of your loop iterations below just grab the values from
> > > > > > > the buffer and store them in a variable.
> > > > > > >
> > > > > > > > +               struct input_dev *idev = ctlr->imu_input;
> > > > > > > > +               int i;
> > > > > > > > +               int value[6];
> > > > > > > > +
> > > > > > > > +               for (i = 0; i < 3; i++) { /* there are 3 reports */
> > > > > > > > +                       ctlr->timestamp += 5000; /* each is 5 ms apart */
> > > > > > > > +                       input_event(idev, EV_MSC, MSC_TIMESTAMP,
> > > > > > > > +                                   ctlr->timestamp);
> > > > > > >
> > > > > > > How sure are you that this is always 5ms? Is there a hardware
> > > > > > > timestamp somewhere? If I look at our DS4 the timing isn't guaranteed
> > > > > > > (Bluetooth is lossy) and not all packets even make it.
> > > > > > >
> > > > > >
> > > > > > It appears that the closest thing to a hardware timestamp available is a
> > > > > > quickly incrementing 1-byte timer sent with every report. It's only really
> > > > > > useful for latency estimation. Each input report includes 3 IMU samples
> > > > > > which are 5ms apart for the joy-cons. It's recently come to my attention
> > > > > > that the samples may be spaced differently for the pro controller, so I'm
> > > > > > going to need to dive into this more anyway. I'm not sure what a great
> > > > > > way would be to handle lost reports.
> > > > > >
> > > > > > > > +
> > > > > > > > +                       /*
> > > > > > > > +                        * Rather than convert to floats, we adjust by
> > > > > > > > +                        * calibration factors and then multiply by the default
> > > > > > > > +                        * scaling values. This way, the consumer only needs to
> > > > > > > > +                        * divide by the default scale values.
> > > > > > > > +                        */
> > > > > > > > +                       value[0] = (imu_data[i].gyro_x -
> > > > > > > > +                                   ctlr->gyro_cal.offset[0]) *
> > > > > > > > +                                   DFLT_GYRO_SCALE / ctlr->gyro_cal.scale[0];
> > > > > > > > +                       value[1] = (imu_data[i].gyro_y -
> > > > > > > > +                                   ctlr->gyro_cal.offset[1]) *
> > > > > > > > +                                   DFLT_GYRO_SCALE / ctlr->gyro_cal.scale[1];
> > > > > > > > +                       value[2] = (imu_data[i].gyro_z -
> > > > > > > > +                                   ctlr->gyro_cal.offset[2]) *
> > > > > > > > +                                   DFLT_GYRO_SCALE / ctlr->gyro_cal.scale[2];
> > > > > > > > +
> > > > > > > > +                       value[3] = (imu_data[i].accel_x -
> > > > > > > > +                                   ctlr->accel_cal.offset[0]) *
> > > > > > > > +                                   DFLT_ACCEL_SCALE / ctlr->accel_cal.scale[0];
> > > > > > > > +                       value[4] = (imu_data[i].accel_y -
> > > > > > > > +                                   ctlr->accel_cal.offset[1]) *
> > > > > > > > +                                   DFLT_ACCEL_SCALE / ctlr->accel_cal.scale[1];
> > > > > > > > +                       value[5] = (imu_data[i].accel_z -
> > > > > > > > +                                   ctlr->accel_cal.offset[2]) *
> > > > > > > > +                                   DFLT_ACCEL_SCALE / ctlr->accel_cal.scale[2];
> > > > > > >
> > > > > > > Just in case I would double check the precision of your calculations.
> > > > > > > For DS4 we had similar calculations, but we had a small loss of
> > > > > > > precision, which ultimately caused major calculation errors.
> > > > > > > (Applications often use accelerometer + gyro data to calculate an
> > > > > > > absolute position. This involves  integration.. and small errors
> > > > > > > become big). We had to use the "mult_frac" macro to restore some of
> > > > > > > the precision during the calculations. It might be something to double
> > > > > > > check.
> > > > > > >
> > > > > >
> > > > > > That's good to know. I'll look more closely at how it's implemented in
> > > > > > hid-sony.
> > > > > >
> > > > > > > In addition what orientation are you using for the axes? I need to
> > > > > > > double check the DS4 datasheets, but I think we were using a "right
> > > > > > > handed" coordinate system. (So if you make a fist of your right hand
> > > > > > > with thumb up, the gyro curls around it counter clockwise along the
> > > > > > > direction of your fingers).
> > > > > > >
> > > > > >
> > > > > > The orientation of the axes (and much more) are documented here:
> > > > > > https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/master/imu_sensor_notes.md
> > > > > > Since the the right vs. left joy-cons have different axes orientations, I
> > > > > > assume it's preferable to standardize it all in software to match the
> > > > > > orientation of the DS4.
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +                       input_report_abs(idev, ABS_RX, value[0]);
> > > > > > > > +                       input_report_abs(idev, ABS_RY, value[1]);
> > > > > > > > +                       input_report_abs(idev, ABS_RZ, value[2]);
> > > > > > > > +                       input_report_abs(idev, ABS_X, value[3]);
> > > > > > > > +                       input_report_abs(idev, ABS_Y, value[4]);
> > > > > > > > +                       input_report_abs(idev, ABS_Z, value[5]);
> > > > > > > > +                       input_sync(idev);
> > > > > > > > +               }
> > > > > > > > +       }
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void joycon_rumble_worker(struct work_struct *work)
> > > > > > > > @@ -950,6 +1131,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
> > > > > > > >  {
> > > > > > > >         struct hid_device *hdev;
> > > > > > > >         const char *name;
> > > > > > > > +       const char *imu_name;
> > > > > > > >         int ret;
> > > > > > > >         int i;
> > > > > > > >
> > > > > > > > @@ -958,12 +1140,15 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
> > > > > > > >         switch (hdev->product) {
> > > > > > > >         case USB_DEVICE_ID_NINTENDO_PROCON:
> > > > > > > >                 name = "Nintendo Switch Pro Controller";
> > > > > > > > +               imu_name = "Nintendo Switch Pro Controller IMU";
> > > > > > > >                 break;
> > > > > > > >         case USB_DEVICE_ID_NINTENDO_JOYCONL:
> > > > > > > >                 name = "Nintendo Switch Left Joy-Con";
> > > > > > > > +               imu_name = "Nintendo Switch Left Joy-Con IMU";
> > > > > > > >                 break;
> > > > > > > >         case USB_DEVICE_ID_NINTENDO_JOYCONR:
> > > > > > > >                 name = "Nintendo Switch Right Joy-Con";
> > > > > > > > +               imu_name = "Nintendo Switch Right Joy-Con IMU";
> > > > > > > >                 break;
> > > > > > > >         default: /* Should be impossible */
> > > > > > > >                 hid_err(hdev, "Invalid hid product\n");
> > > > > > > > @@ -1029,6 +1214,55 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
> > > > > > > >         if (ret)
> > > > > > > >                 return ret;
> > > > > > > >
> > > > > > > > +       /* configure the imu input device */
> > > > > > > > +       ctlr->imu_input = devm_input_allocate_device(&hdev->dev);
> > > > > > > > +       if (!ctlr->imu_input)
> > > > > > > > +               return -ENOMEM;
> > > > > > > > +
> > > > > > > > +       ctlr->imu_input->id.bustype = hdev->bus;
> > > > > > > > +       ctlr->imu_input->id.vendor = hdev->vendor;
> > > > > > > > +       ctlr->imu_input->id.product = hdev->product;
> > > > > > > > +       ctlr->imu_input->id.version = hdev->version;
> > > > > > > > +       ctlr->imu_input->uniq = ctlr->mac_addr_str;
> > > > > > > > +       ctlr->imu_input->name = imu_name;
> > > > > > > > +       input_set_drvdata(ctlr->imu_input, ctlr);
> > > > > > > > +
> > > > > > > > +       /* configure imu axes */
> > > > > > > > +       input_set_abs_params(ctlr->imu_input, ABS_X,
> > > > > > > > +                            -JC_MAX_ACCEL_MAG, JC_MAX_ACCEL_MAG,
> > > > > > > > +                            JC_ACCEL_FUZZ, JC_ACCEL_FLAT);
> > > > > > > > +       input_set_abs_params(ctlr->imu_input, ABS_Y,
> > > > > > > > +                            -JC_MAX_ACCEL_MAG, JC_MAX_ACCEL_MAG,
> > > > > > > > +                            JC_ACCEL_FUZZ, JC_ACCEL_FLAT);
> > > > > > > > +       input_set_abs_params(ctlr->imu_input, ABS_Z,
> > > > > > > > +                            -JC_MAX_ACCEL_MAG, JC_MAX_ACCEL_MAG,
> > > > > > > > +                            JC_ACCEL_FUZZ, JC_ACCEL_FLAT);
> > > > > > > > +       input_abs_set_res(ctlr->imu_input, ABS_X, JC_ACCEL_RES);
> > > > > > > > +       input_abs_set_res(ctlr->imu_input, ABS_Y, JC_ACCEL_RES);
> > > > > > > > +       input_abs_set_res(ctlr->imu_input, ABS_Z, JC_ACCEL_RES);
> > > > > > > > +
> > > > > > > > +       input_set_abs_params(ctlr->imu_input, ABS_RX,
> > > > > > > > +                            -JC_MAX_GYRO_MAG, JC_MAX_GYRO_MAG,
> > > > > > > > +                            JC_GYRO_FUZZ, JC_GYRO_FLAT);
> > > > > > > > +       input_set_abs_params(ctlr->imu_input, ABS_RY,
> > > > > > > > +                            -JC_MAX_GYRO_MAG, JC_MAX_GYRO_MAG,
> > > > > > > > +                            JC_GYRO_FUZZ, JC_GYRO_FLAT);
> > > > > > > > +       input_set_abs_params(ctlr->imu_input, ABS_RZ,
> > > > > > > > +                            -JC_MAX_GYRO_MAG, JC_MAX_GYRO_MAG,
> > > > > > > > +                            JC_GYRO_FUZZ, JC_GYRO_FLAT);
> > > > > > > > +
> > > > > > > > +       input_abs_set_res(ctlr->imu_input, ABS_RX, JC_GYRO_RES);
> > > > > > > > +       input_abs_set_res(ctlr->imu_input, ABS_RY, JC_GYRO_RES);
> > > > > > > > +       input_abs_set_res(ctlr->imu_input, ABS_RZ, JC_GYRO_RES);
> > > > > > > > +
> > > > > > > > +       __set_bit(EV_MSC, ctlr->imu_input->evbit);
> > > > > > > > +       __set_bit(MSC_TIMESTAMP, ctlr->imu_input->mscbit);
> > > > > > > > +       __set_bit(INPUT_PROP_ACCELEROMETER, ctlr->imu_input->propbit);
> > > > > > > > +
> > > > > > > > +       ret = input_register_device(ctlr->imu_input);
> > > > > > > > +       if (ret)
> > > > > > > > +               return ret;
> > > > > > > > +
> > > > > > > >         return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -1288,7 +1522,7 @@ static int joycon_read_mac(struct joycon_ctlr *ctlr)
> > > > > > > >         report = (struct joycon_input_report *)ctlr->input_buf;
> > > > > > > >
> > > > > > > >         for (i = 4, j = 0; j < 6; i++, j++)
> > > > > > > > -               ctlr->mac_addr[j] = report->reply.data[i];
> > > > > > > > +               ctlr->mac_addr[j] = report->subcmd_reply.data[i];
> > > > > > > >
> > > > > > > >         ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL,
> > > > > > > >                                             "%02X:%02X:%02X:%02X:%02X:%02X",
> > > > > > > > @@ -1343,7 +1577,7 @@ static int joycon_ctlr_handle_event(struct joycon_ctlr *ctlr, u8 *data,
> > > > > > > >                             data[0] != JC_INPUT_SUBCMD_REPLY)
> > > > > > > >                                 break;
> > > > > > > >                         report = (struct joycon_input_report *)data;
> > > > > > > > -                       if (report->reply.id == ctlr->subcmd_ack_match)
> > > > > > > > +                       if (report->subcmd_reply.id == ctlr->subcmd_ack_match)
> > > > > > > >                                 match = true;
> > > > > > > >                         break;
> > > > > > > >                 default:
> > > > > > > > @@ -1469,6 +1703,16 @@ static int nintendo_hid_probe(struct hid_device *hdev,
> > > > > > > >                 hid_warn(hdev, "Analog stick positions may be inaccurate\n");
> > > > > > > >         }
> > > > > > > >
> > > > > > > > +       /* get IMU calibration data, and parse it */
> > > > > > > > +       ret = joycon_request_imu_calibration(ctlr);
> > > > > > > > +       if (ret) {
> > > > > > > > +               /*
> > > > > > > > +                * We can function with default calibration, but it may be
> > > > > > > > +                * inaccurate. Provide a warning, and continue on.
> > > > > > > > +                */
> > > > > > > > +               hid_warn(hdev, "Unable to read IMU calibration data\n");
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > >         /* Set the reporting mode to 0x30, which is the full report mode */
> > > > > > > >         ret = joycon_set_report_mode(ctlr);
> > > > > > > >         if (ret) {
> > > > > > > > @@ -1483,6 +1727,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
> > > > > > > >                 goto err_mutex;
> > > > > > > >         }
> > > > > > > >
> > > > > > > > +       /* Enable the IMU */
> > > > > > > > +       ret = joycon_enable_imu(ctlr, true);
> > > > > > > > +       if (ret) {
> > > > > > > > +               hid_err(hdev, "Failed to enable the IMU; ret=%d\n", ret);
> > > > > > > > +               goto err_mutex;
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > >         ret = joycon_read_mac(ctlr);
> > > > > > > >         if (ret) {
> > > > > > > >                 hid_err(hdev, "Failed to retrieve controller MAC; ret=%d\n",
> > > > > > > > --
> > > > > > > > 2.24.1
> > > > > > > >
> > >
> > >
> > >
> > > --
> > > Daniel Ogorchock



-- 
Daniel Ogorchock
